//
//  HomeRouter.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 03/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import UIKit

class HomeRouter {
    /**
     Public property for make the viewcontroller
    */
    var viewController: UIViewController {
        return makeViewController()
    }
    
    private var sourceView: UIViewController?
    
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else {
            fatalError("Source view must be a UIViewController")
        }
        
        self.sourceView = view
    }
    
    /**
     Create the own viewcontroller
    */
    private func makeViewController() -> UIViewController {
        let view = HomeView(nibName: "HomeView", bundle: Bundle.main)
        
        return view
    }
    
    /**
     Navigate to detail view
    */
    func navigateToDetailView(movieID: String) {
        let detailViewRouter = DetailViewRouter(movieID: movieID).viewController
        
        sourceView?.navigationController?.pushViewController(detailViewRouter, animated: true)
    }
}
