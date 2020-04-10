//
//  MovieDetail.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 03/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import Foundation

// MARK: - MovieDetail
struct MovieDetail: Codable {
    let title: String
    let posterPath: String
    let overview: String
    let releaseDate: String
    let homepage: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case homepage
        case voteAverage = "vote_average"
    }
}
