//
//  HomeViewModel.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 01/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import RxSwift
import RxCocoa

class HomeViewModel {
    private var managerConnections = ManagerConnections()
    private(set) weak var view: HomeView?
    private var router: HomeRouter?
    private let disposeBag = DisposeBag()

    /**
     Bind for initialize properties
     - Parameter view: the view
     - Parameter router: the router
    */
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }

    /**
     Call Network manager for retrieve one list of popular movies.
     
     - Returns: A Observable array of Movie
    */
    func getListMoviesData() -> Observable<[Movie]> {
        return managerConnections.getPopularMovies()
    }
    
    /**
     Call router for create the navigation to detail view
    */
    func makeDetailView(movieID: String) {
        router?.navigateToDetailView(movieID: movieID)
    }
}

