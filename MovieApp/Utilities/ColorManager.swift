//
//  ColorManager.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 7.02.2021.
//

import UIKit

public class ColorManager {
    
    static let shared = ColorManager()
    
    public func addGradientBackgroundLayer(view: UIView) {
        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.frame
        gradientLayer.colors = [UIColor.systemIndigo.cgColor, UIColor.purple.cgColor]
//        gradientLayer.shouldRasterize = true
        gradientLayer.locations = [0.0 , 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: view.frame.size.height)

        
        view.layer.addSublayer(gradientLayer)
    }
    
    
}
