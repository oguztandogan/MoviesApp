//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDirectorsNameLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    
   
    @IBOutlet weak var backgroundView: UIView!
    // MARK: - Public properties -

    var presenter: MovieDetailsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getMovieDetails()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    private func setupUI() {
        ColorManager.shared.addGradientBackgroundLayer(view: backgroundView)
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
}

// MARK: - Extensions -

extension MovieDetailsViewController: MovieDetailsViewInterface {

    func setMovieNameLabel(title: String?) {
        movieNameLabel.text = title
    }
    
    func setMoviePoster(moviePosterUrl: String?) {
        moviePosterImageView.kf.setImage(with: URL(string: moviePosterUrl ?? ""))
    }
    
    func setMovieDirectorsLabel(directors: String?) {
        movieDirectorsNameLabel.text = directors
    }
    
    func setMovieGenreLabel(genre: String?) {
        movieGenreLabel.text = genre
    }
    
}