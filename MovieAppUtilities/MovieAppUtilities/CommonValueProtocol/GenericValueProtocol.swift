//
//  GenericValueProtocol.swift
//  MovieAppUtilities
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation

public protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value { get }
}
