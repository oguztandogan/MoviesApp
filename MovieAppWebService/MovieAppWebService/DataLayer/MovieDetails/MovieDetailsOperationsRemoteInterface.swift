//
//  MovieDetailsOperationsRemoteInterface.swift
//  MovieAppWebService
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation
import RxSwift

public protocol MovieDetailsOperationsRemoteInterface {
    
    func getMovieDetails(params: MovieDetailsRequestModel) -> Single<MovieDetailsResponseModel>
}
