//
//  APIBuilder.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

final class APIBuilder {
    private(set) var urlRequest: URLRequest

    init() {
        guard let url = URL(string: NetworkConstants.baseUrl) else {
            fatalError("Could not create URL: \(NetworkConstants.baseUrl)")
        }

        self.urlRequest = URLRequest(url: url)
    }

    @discardableResult
    func setHost(using host: String) -> APIBuilder {
        urlRequest.url = URL(string: host)
        return self
    }

    @discardableResult
    public func setPath(using path: APIConstants) -> APIBuilder {
        setPath(using: path, argument: [])
        return self
    }

    @discardableResult
    public func setPath(using path: APIConstants, argument: CVarArg) -> APIBuilder {
        setPath(using: path, argument: [argument])
    }

    @discardableResult
    public func setPath(using path: APIConstants, argument: [CVarArg]) -> APIBuilder {
        setPath(using: path.rawValue.localizedFormat(using: argument))
        return self
    }

    @discardableResult
    func setMethod(using method: HTTPMethod) -> APIBuilder {
        urlRequest.httpMethod = method.rawValue
        return self
    }

    @discardableResult
    func setHeaders(using headers: HTTPHeaders) -> APIBuilder {
        for (key, value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        return self
    }

    @discardableResult
    func setParameters(using parameters: RequestParams) -> APIBuilder {
        switch parameters {
        case .body(let params):
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                fatalError("Could not serialize \(params)")
            }

        case .query(let params):
            let queryParams = params.map { pair in
                URLQueryItem(name: pair.key, value: "\(pair.value)")
            }

            if let url = urlRequest.url {
                var components = URLComponents(string: url.absoluteString)
                components?.queryItems = queryParams

                urlRequest.url = components?.url
            }
        }

        return self
    }

    func build() -> URLRequest {
        guard
            let url = urlRequest.url,
            !url.pathComponents.isEmpty
        else {
            fatalError("API should contain at least one path.")
        }

        urlRequest.setValue(ContentType.json, forHTTPHeaderField: HTTPHeader.contentType)
        return urlRequest
    }
}

private extension APIBuilder {
    func setPath(using path: String) {
        let base: URL? = urlRequest.url
        let baseAppend = base?.appendingPathComponent(path).absoluteString.removingPercentEncoding
        guard let baseAppend, let newURL = URL(string: baseAppend) else { return }
        urlRequest.url = newURL
    }
}
