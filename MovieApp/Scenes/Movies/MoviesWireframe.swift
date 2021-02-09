//
//  MoviesWireframe.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MoviesWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Movies", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: MoviesViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = MoviesFormatter()
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MoviesWireframe: MoviesWireframeInterface {
    func navigate(option: MoviesNavigationOption) {
        switch option {
        case .movieDetails(let movieId):
            presentMovieDetails(movieId: movieId)
        }
    }
    
    private func presentMovieDetails(movieId: String?) {
        navigationController?.pushWireframe(MovieDetailsWireframe(movieId: movieId))
    }
}
