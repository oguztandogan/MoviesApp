//
//  TokenProvider.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 29.12.2020.
//

import Foundation

public class TokenProvider {
    
    private(set) var requestToken: String?
    private(set) var apiKey = Endpoints.ApiKey.apiKey.value
    
    public init() {}
    
    func setRequestToken(requestToken: String?) {
        self.requestToken = requestToken
        //TODO normalde keychaine kaydedilecek
    }
    
    func getRequestToken() -> String? {
        return nil
        //TODO keychainden return edilecek
    }
}
