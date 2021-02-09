//
//  MoviesOperationsRemote.swift
//  MovieAppWebService
//
//  Created by Oguz Tandogan on 24.12.2020.
//

import Foundation
import RxSwift

public class MoviesOperationsRemote: MoviesOperationsRemoteInterface {
    
    private let apiManager: HttpClientInterface!
    private let service: MoviesServices!

    public init(apiManager: HttpClientInterface, service: MoviesServices) {
        self.apiManager = apiManager
        self.service = service
    }

    public func getMovies(params: MoviesRequestModel) -> Single<MoviesResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getMoviesParsedResultModule(params: params))
    }

    deinit {
        print("DEINIT MovieDetailsOperationsRemote")
    }
}
