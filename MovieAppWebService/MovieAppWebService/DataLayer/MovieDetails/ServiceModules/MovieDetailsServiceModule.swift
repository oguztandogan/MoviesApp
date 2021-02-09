//
//  MovieDetailsServiceModule.swift
//  MovieAppWebService
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation

public class MovieDetailsServiceModule: ApiServiceProvider<MovieDetailsRequestModel> {
    
    init(request: MovieDetailsRequestModel) {
        super.init(method: .get, path: "", pathType: .baseHost, isAuthRequested: true, data: request)
    }
}
