//
//  Endpoints.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import MovieAppUtilities

typealias PathType = Endpoints.PathType
typealias ApiKey = Endpoints.ApiKey

public enum Endpoints {
        
    public enum PathType: GenericValueProtocol {
        case baseHost

        public typealias Value = String
        
        public var value: String {
            switch self {
            case .baseHost:
                return "https://www.omdbapi.com"
            }
        }
    }
    
    public enum ApiKey: GenericValueProtocol {
        case apiKey
        
        public typealias Value = String
        
        public var value: String {
            switch self {
            case .apiKey:
                return "ad5258e5"
            }
        }
    }
}
