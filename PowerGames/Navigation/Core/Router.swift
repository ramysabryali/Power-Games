//
//  Router.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//
import UIKit
import SwiftUI

protocol Router {
    var rootNavigationController: UINavigationController? { get }
    var navigationController: UINavigationController? { get }
    
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func popTo<Content: View>(_ view: Content)
    
    func close(using style: PresentationStyle, animated: Bool)
    
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func dismiss(for presentationStyle: PresentationStyle, and animated: Bool)
}

extension Router {
    var rootNavigationController: UINavigationController? {
        return UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    }
    
    var navigationController: UINavigationController? {
        UIApplication.shared.topController as? UINavigationController
    }
    
    func pop(animated: Bool = true) {
        navigationController?.pop(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        guard let rootNavigation = rootNavigationController else { return }
        rootNavigation.dismissView(animated: animated)
        rootNavigation.popToRoot(animated: animated)
    }
    
    func popTo<Content: View>(_ view: Content) {
        navigationController?.popTo(view: view)
    }
    
    func close(using style: PresentationStyle, animated: Bool = true) {
        style == .push ? pop(animated: animated) : dismiss(animated: animated)
    }
    
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.dismissView(animated: animated, completion: completion)
    }
    
    func dismiss(for presentationStyle: PresentationStyle, and animated: Bool = true) {
        presentationStyle == .present ? dismiss(animated: animated) : pop(animated: animated)
    }
}
