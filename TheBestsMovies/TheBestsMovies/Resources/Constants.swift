//
//  Constants.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 01/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import Foundation

struct Constants {
    static let apiKey = "?api_key=POR_AQUÍ_TU_API_KEY"
    
    struct URL {
        static let urlListMovies = "https://api.themoviedb.org/3/movie/popular"
        static let urlImage = "https://image.tmdb.org/t/p/w200"
        static let urlDetailMovie = "https://api.themoviedb.org/3/movie/"
    }
}
