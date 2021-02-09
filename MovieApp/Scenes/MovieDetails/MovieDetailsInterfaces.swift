//
//  MovieDetailsInterfaces.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import MovieAppWebService

protocol MovieDetailsWireframeInterface: WireframeInterface {
}

protocol MovieDetailsViewInterface: ViewInterface {
    func setMovieNameLabel(title: String?)
    func setMoviePoster(moviePosterUrl: String?)
    func setMovieDirectorsLabel(directors: String?)
    func setMovieGenreLabel(genre: String?)
}

protocol MovieDetailsPresenterInterface: PresenterInterface {
    func getMovieDetails()
}

protocol MovieDetailsFormatterInterface: FormatterInterface {
}

protocol MovieDetailsInteractorInterface: InteractorInterface {
    func getMovieDetails(callback: MovieDetailsCallback, params: MovieDetailsRequestModel)
}