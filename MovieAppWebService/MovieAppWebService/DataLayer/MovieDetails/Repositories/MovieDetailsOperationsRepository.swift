//
//  MovieDetailsOperationsRepository.swift
//  MovieAppWebService
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation
import RxSwift

public class MovieDetailsOperationsRepository: MovieDetailsOperationsRepositoryInterface {
    
    private let apiRemote: MovieDetailsOperationsRemoteInterface!
    
    public init(apiRemote: MovieDetailsOperationsRemoteInterface) {
        self.apiRemote = apiRemote
    }

    public func getMovieDetails(params: MovieDetailsRequestModel) -> Single<MovieDetailsResponseModel> {
        return apiRemote.getMovieDetails(params: params)
    }

}
