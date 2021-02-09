//
//  MovieDetailsOperationsRemote.swift
//  MovieAppWebService
//
//  Created by Oguz Tandogan on 31.01.2021.
//

import Foundation
import RxSwift

public class MovieDetailsOperationsRemote: MovieDetailsOperationsRemoteInterface {
    
    private let apiManager: HttpClientInterface!
    private let service: MovieDetailsServices!

    public init(apiManager: HttpClientInterface, service: MovieDetailsServices) {
        self.apiManager = apiManager
        self.service = service
    }

    public func getMovieDetails(params: MovieDetailsRequestModel) -> Single<MovieDetailsResponseModel> {
        return apiManager.executeRequest(urlRequestConvertible: service.getMovieDetailsParsedResultModule(params: params))
    }

    deinit {
        print("DEINIT MovieDetailsOperationsRemote")
    }
}
