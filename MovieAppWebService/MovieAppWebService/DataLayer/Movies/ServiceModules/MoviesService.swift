//
//  MoviesService.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 24.12.2020.
//

import Foundation

public class MoviesServices {

    public init() {
        
    }
    
    func getMoviesParsedResultModule(params: MoviesRequestModel) -> MoviesServiceModule {
        return MoviesServiceModule(request: params)
    }
}
