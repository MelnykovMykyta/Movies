//
//  MovieModel.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation

struct MoviesList: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let genreIDS: [Int]
    let id: Int
    let title, overview: String
    let posterPath, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
