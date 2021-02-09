//
//  MovieOperationsRemoteInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 24.12.2020.
//

import Foundation
import RxSwift

public protocol MoviesOperationsRemoteInterface {
    
    func getMovies(params: MoviesRequestModel) -> Single<MoviesResponseModel>
}
