//
//  MoviesRequestModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 24.12.2020.
//

import Foundation

public class MoviesRequestModel: CodableDataProtocol {

    private(set) var apiKey: String? = Endpoints.ApiKey.apiKey.value
    public var movieId: String?
    
    public init(movieId: String?) {
        self.movieId = movieId
    }
    
    public enum CodingKeys: String, CodingKey {

        case apiKey = "apikey"
        case movieId = "s"
    }
}
