//
//  ApiAdapter.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 19.11.2020.
//

import Alamofire

public class ApiAdapter: RequestAdapter {
    
    public init() {
        
    }
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(urlRequest))
    }
}
