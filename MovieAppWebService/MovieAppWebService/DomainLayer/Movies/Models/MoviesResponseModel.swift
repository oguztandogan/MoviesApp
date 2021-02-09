//
//  MoviesResponseModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 24.12.2020.
//

import Foundation

public class MoviesResponseModel: BaseResponseProtocol {
    
    public var error: BaseErrorResponse?
    public let search: [MoviesListResponseModel]?
    public let totalResults: String?
    public let response: String?
    
    public init(search: [MoviesListResponseModel]?,
                totalResults: String?,
                response: String?) {
        self.search = search
        self.totalResults = totalResults
        self.response = response
    }

        private enum CodingKeys: String, CodingKey {
            case search = "Search"
            case totalResults = "totalResults"
            case response = "Response"
        }
}
