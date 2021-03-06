//
//  MovieDetailsWireframe.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieDetailsWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)

    // MARK: - Module setup -

    init(movieId: String?) {
        let moduleViewController = storyboard.instantiateViewController(ofType: MovieDetailsViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = MovieDetailsFormatter()
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self, movieId: movieId)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MovieDetailsWireframe: MovieDetailsWireframeInterface {
    
    
}
