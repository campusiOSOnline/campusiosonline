//
//  DetailViewRouter.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 03/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import UIKit

class DetailViewRouter {
    /**
     Public property for make the viewcontroller
    */
    var viewController: UIViewController {
        return makeViewController()
    }
    
    var movieID: String
    private var sourceView: UIViewController?
    
    init(movieID: String? = "") {
        self.movieID = movieID ?? ""
    }
    
    /**
     Create the own viewcontroller
    */
    func setSourceView(_ sourceView: Any?) {
        guard let view = sourceView as? UIViewController else {
            fatalError("Source view must be a UIViewController")
        }
        
        self.sourceView = view
    }
    
    /**
     Create the own viewcontroller
    */
    func makeViewController() -> UIViewController {
        let view = DetailView(nibName: "DetailView", bundle: Bundle.main)
        view.movieID = movieID
        return view
    }
}
