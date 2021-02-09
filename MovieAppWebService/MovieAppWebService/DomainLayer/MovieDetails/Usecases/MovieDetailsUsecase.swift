//
//  GetBasicTokenUsecase.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import RxSwift

public class MovieDetailsUsecase: SingleUseCase<MovieDetailsRequestModel, MovieDetailsResponseModel> {
    
    private let repository: MovieDetailsOperationsRepositoryInterface!
    
    public init(repository: MovieDetailsOperationsRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: MovieDetailsRequestModel) -> Single<MovieDetailsResponseModel>? {
        return repository.getMovieDetails(params: parameter)
    }
}
