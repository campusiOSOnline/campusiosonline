//
//  Movie.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 01/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import Foundation

struct Movies: Codable {
    let listOfmovies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case listOfmovies = "results"
    }
}

struct Movie: Codable {
    let title: String
    let popularity: Double
    let movieID: Int
    let voteCount: Int
    let originalTitle: String
    let voteAverage: Double
    let sinopsis: String
    let releaseDate: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case popularity
        case movieID = "id"
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case image = "poster_path"
    }
}
