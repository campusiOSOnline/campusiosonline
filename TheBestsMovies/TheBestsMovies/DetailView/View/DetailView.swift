//
//  DetailView.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 03/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import UIKit
import RxSwift

class DetailView: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageMovie: UIImageView!
    @IBOutlet private weak var descriptionMovieLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var homePageLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    
    private var router = DetailViewRouter()
    private var viewModel = DetailViewModel()
    private let disposeBag = DisposeBag()
    
    var movieID: String?
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataAndShowDataInView()
        viewModel.bind(view: self, router: router)
    }

    //Privates functions
    private func getDataAndShowDataInView() {
        guard let idMovie = movieID else { return }
        return viewModel.getMovieData(movieID: idMovie).subscribe(
            onNext: { movie in
                self.showMovieData(movie: movie)
        },
            onError: { error in
                print(error.localizedDescription)
        },
            onCompleted: {
        }).disposed(by: disposeBag)
    }
    
    private func showMovieData(movie: MovieDetail) {
        DispatchQueue.main.async {
            self.titleLabel.text = movie.title
            self.imageMovie.imageFromServerURL(urlString: Constants.URL.urlImage+movie.posterPath, placeHolderImage: UIImage(named: "claqueta")!)
            self.descriptionMovieLabel.text = movie.overview
            self.releaseDateLabel.text = movie.releaseDate
            self.homePageLabel.text = movie.homepage
            self.voteAverageLabel.text = String(movie.voteAverage)
        }
    }
}
