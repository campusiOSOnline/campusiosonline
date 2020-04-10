//
//  HomeView.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 01/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeView: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activity: UIActivityIndicatorView!
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var movies = [Movie]()
    private var filteredMovies = [Movie]()
    private let disposeBag = DisposeBag()
    
    lazy var searchController: UISearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = true
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.barStyle = .black
        controller.searchBar.barTintColor = .black
        controller.searchBar.backgroundColor = .clear
        controller.searchBar.placeholder = "Search a movie"
        
        return controller
    })()
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "The bests movies"
        configureTableView()
        getData()
        manageSearchBarController()
        viewModel.bind(view: self, router: router)
    }
    
    //Privates functions
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    private func getData() {
        return viewModel.getListMoviesData()
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { movies in
                    self.movies = movies
                    self.reloadTableView()
            },
                onError: { error in
                    print(error.localizedDescription)
            },
                onCompleted: {
            }).disposed(by: disposeBag)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }
    
    private func manageSearchBarController() {
        let searchBar = searchController.searchBar
        searchController.delegate = self
        tableView.tableHeaderView = searchBar
        tableView.contentOffset = CGPoint(x: 0, y: searchBar.frame.size.height)
        
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { (text) in
                self.filteredMovies = self.movies.filter { result in
                    self.reloadTableView()
                    return result.title.contains(text)
                }
            })
            .disposed(by: self.disposeBag)
    }
}

extension HomeView : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive && searchController.searchBar.text != "") {
            return self.filteredMovies.count
        }
        else {
            return self.movies.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 208
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : MovieTableViewCell.self)) as! MovieTableViewCell
        if (searchController.isActive && searchController.searchBar.text != "") {
            cell.imageMovie.imageFromServerURL(urlString: "\(Constants.URL.urlImage+self.filteredMovies[indexPath.row].image)", placeHolderImage: UIImage(named: "claqueta")!)
            cell.activity.isHidden = true
            cell.titleMovieLabel.text = self.filteredMovies[indexPath.row].title
            cell.descriptionMovieLabel.text = self.filteredMovies[indexPath.row].sinopsis
        } else {
            cell.imageMovie.imageFromServerURL(urlString: "\(Constants.URL.urlImage+self.movies[indexPath.row].image)", placeHolderImage: UIImage(named: "claqueta")!)
            cell.activity.isHidden = true
            cell.titleMovieLabel.text = self.movies[indexPath.row].title
            cell.descriptionMovieLabel.text = self.movies[indexPath.row].sinopsis
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (searchController.isActive && searchController.searchBar.text != "") {
            searchController.dismiss(animated: true)
            viewModel.makeDetailView(movieID: String(self.filteredMovies[indexPath.row].movieID))
        } else {
            viewModel.makeDetailView(movieID: String(self.movies[indexPath.row].movieID))
        }
    }
}

extension HomeView: UISearchControllerDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        reloadTableView()
    }
}
