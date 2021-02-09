//
//  MovieDetailsRequestModel.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 14.12.2020.
//

import Foundation

public class MovieDetailsRequestModel: CodableDataProtocol {

    private(set) var apiKey: String? = Endpoints.ApiKey.apiKey.value
    private(set) var movieId: String?

    public init(movieId: String?) {
        self.movieId = movieId
    }
    
    public enum CodingKeys: String, CodingKey {

        case apiKey = "apiKey"
        case movieId = "i"
    }
}

