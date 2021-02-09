//
//  MoviesOperationsRepository.swift
//  MovieAppWebService
//
//  Created by Oguz Tandogan on 24.12.2020.
//

import Foundation
import RxSwift

public class MoviesOperationsRepository: MoviesOperationsRepositoryInterface {
    
    private let apiRemote: MoviesOperationsRemoteInterface!
    
    public init(apiRemote: MoviesOperationsRemoteInterface) {
        self.apiRemote = apiRemote
    }

    public func getMovies(params: MoviesRequestModel) -> Single<MoviesResponseModel> {
        return apiRemote.getMovies(params: params)
    }

}
