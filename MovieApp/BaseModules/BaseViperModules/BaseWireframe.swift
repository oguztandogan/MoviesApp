//
//  BaseWireframe.swift
//  Movee
//
//  Created by Oguz Tandogan on 17.11.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import UIKit

public protocol WireframeInterface: class {
    func push(to type: Wireframes, navigationType: WireframeNavigationType)
//    func popToDestinationWireFrame(destinationView: WireframeDestinationType)
    func pushAndRemoveYourself(to type: Wireframes)
    func dissmissYourself()
    func show(type: Wireframes)
    func changeRoot(to wireframe: Wireframes)
}

extension WireframeInterface {
    
}

public protocol WireframeDataProtocol {
    
}

public class BaseWireframe {
    
    private unowned var _viewController: UIViewController
    
    //to retain view controller reference upon first access
    private var _temporaryStoredViewController: UIViewController?
    
    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
    
    public func chageRoot(to wireframe: Wireframes) {
        if let navController = viewController as? UINavigationController {
            navController.viewControllers = [wireframe.value.viewController]
        } else if let navController = navigationController {
            navController.viewControllers = [_viewController]
        }
    }
    
    public func push(to type: Wireframes, navigationType: WireframeNavigationType) {
        let wireFrame = type.value
        switch navigationType {
        case .push:
            if let navigationController = navigationController {
                navigationController.pushWireframe(wireFrame)
            } else {
                viewController.pushWireframeFromViewController(wireFrame)
            }
        case .present:
            if let navigationController = navigationController {
                navigationController.presentWireframe(wireFrame)
            } else {
                viewController.presentWireframeFromViewController(wireFrame)
            }
        }
    }
    
//    public func popToDestinationWireframe(destinationView: WireframeDestinationType) {
//        guard let vc = navigationController?.viewControllers.filter({ (controller) -> Bool in
//            if controller.isKind(of: destinationView.value) {
//                return true
//            } else {
//                return false
//            }
//        }).first else { return }
//        navigationController?.popToViewController(vc, animatec: true)
//    }
}

extension BaseWireframe: WireframeInterface {
    
    public func changeRoot(to wireframe: Wireframes) {
        if let navController = viewController as? UINavigationController {
            navController.viewControllers = [wireframe.value.viewController]
        } else if let navController = navigationController {
            navController.viewControllers = [viewController]
        }
    }
    
    public func pushAndRemoveYourself(to wireframeType: Wireframes) {
        let wireframe = wireframeType.value
        navigationController?.pushWireframe(wireframe)
        navigationController?.viewControllers = navigationController?.viewControllers.filter({ (viewConroller) -> Bool in
            if viewConroller.isKind(of: type(of: self.viewController)) {return false}
            return true
        }) ?? [UIViewController.init()]
    }
    
    public func dissmissYourself() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    public func show(type: Wireframes) {
        viewController.show(type.value.viewController, sender: nil)
    }
}

extension BaseWireframe{
    
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}

extension UIViewController {
    
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
    
}

extension UINavigationController {
    func presentWireframe(_ wireframe: Wireframes, animated: Bool = true) {
        self.present(wireframe.value.viewController, animated: animated, completion: nil)
    }
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
    
    //    func popDestinationWireframe() {
    //        guard let vc = navigationController?.viewControllers.filter({ (controller) -> Bool in
    //            if controller.isKind(of: ViewController1.self) {
    //                return true
    //            } else {
    //                return false
    //            }
    //        })[0] else { return }
    //
    //        navigationController?.popToViewController(vc, animated: true)
    //    }
}

extension UIViewController {
    func pushWireframeFromViewController(_ wireframe: BaseWireframe, animated: Bool = true) {
        guard let nav = self as? UINavigationController else { return }
        nav.pushViewController(wireframe.viewController, animated: animated)
    }
    func presentWireframeFromViewController(_ wireframe: BaseWireframe, animated: Bool = true) {
        guard let nav = self as? UINavigationController else { return }
        nav.present(wireframe.viewController, animated: animated, completion: nil)
    }
}
