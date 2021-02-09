//
//  MoviesUsecase.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 24.12.2020.
//

import Foundation
import RxSwift

public class MoviesUsecase: SingleUseCase<MoviesRequestModel, MoviesResponseModel> {
    
    private let repository: MoviesOperationsRepositoryInterface!
    
    public init(repository: MoviesOperationsRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: MoviesRequestModel) -> Single<MoviesResponseModel>? {
        return repository.getMovies(params: parameter)
    }
}
