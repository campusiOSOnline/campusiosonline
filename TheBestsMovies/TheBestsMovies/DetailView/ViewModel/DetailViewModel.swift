//
//  DetailViewModel.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 03/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import Foundation
import RxSwift

class DetailViewModel {
    private var managerConnections = ManagerConnections()
    private(set) weak var view: DetailView?
    private var router: DetailViewRouter?
    
    /**
     Bind for initialize properties
     - Parameter view: the view
     - Parameter router: the router
    */
    func bind(view: DetailView, router: DetailViewRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }
    
    /**
     Call Network manager for retrieve one movie.
     
     - Returns: A Observable array of Movie
    */
    func getMovieData(movieID: String) -> Observable<MovieDetail> {
        return managerConnections.getDetailMovie(movieID: movieID)
    }
}
