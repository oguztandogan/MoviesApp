//
//  StoryboardExtension.swift
//  Movee
//
//  Created by Oguz Tandogan on 17.11.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}
