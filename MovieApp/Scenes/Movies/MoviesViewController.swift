//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Oguz Tandogan on 31.01.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import Lottie

final class MoviesViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    let animationView = Lottie.AnimationView(name: "196-material-wave-loading")
    
    // MARK: - Public properties -
    
    var presenter: MoviesPresenterInterface!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureProperties()
        searchBar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ColorManager.shared.addGradientBackgroundLayer(view: backgroundView)
        
    }
    
    private func loadMoviesData() {
        presenter.getSearchedMovies(movieId: searchBar.text)
    }
    
    func configureProperties() {
        navigationItem.title = "Movies"
        navigationItem.hidesSearchBarWhenScrolling = false
        //        ColorManager.shared.addGradientBackgroundLayer(view: backgroundView)
    }
}

// MARK: - Extensions -

extension MoviesViewController: MoviesViewInterface {
    
    func reloadData() {
        moviesTableView.reloadData()
    }
    
    func playLoadingAnimation() {
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .autoReverse
        view.addSubview(animationView)
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
    
    func stopLoadingAnimation() {
        animationView.removeFromSuperview()
    }
    
    func createAlertViewForResponseError() {
        let dialogMessage = UIAlertController(title: "Uyarı", message: "I am an alert message you cannot dissmiss.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        dialogMessage.addAction(okButton)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

// MARK: - Table View Extension -

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowNumber()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as? MovieListTableViewCell else {
            fatalError("Cell type is incorrect.")
        }
        let item = presenter.loadTableViewData(at: indexPath)
        cell.movieTitle.text = item?.title
        cell.movieGenreLabel.text = item?.year
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath)
    }
    
    
}

// MARK: - Search Bar Extension -

extension MoviesViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        presenter.getSearchedMovies(movieId: searchBar.text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.getSearchedMovies(movieId: searchBar.text)
    }
}

