//
//  MovieDetailsServices.swift
//  MovieAppWebService
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation

public class MovieDetailsServices {

    public init() {
        
    }
    
    func getMovieDetailsParsedResultModule(params: MovieDetailsRequestModel) -> MovieDetailsServiceModule {
        return MovieDetailsServiceModule(request: params)
    }
}
