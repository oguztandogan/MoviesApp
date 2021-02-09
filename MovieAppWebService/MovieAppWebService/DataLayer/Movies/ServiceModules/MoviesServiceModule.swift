//
//  MoviesServiceModule.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 24.12.2020.
//

import Foundation

public class MoviesServiceModule: ApiServiceProvider<MoviesRequestModel> {
    
    init(request: MoviesRequestModel) {
        super.init(method: .get, path: "", pathType: .baseHost, isAuthRequested: true, data: request)
    }
}
