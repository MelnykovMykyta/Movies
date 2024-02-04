//
//  MovieModel.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import RealmSwift

struct MoviesList: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let genreIDS: [Int]
    let id: Int
    let title, overview: String
    let posterPath, releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

class MovieDBObject: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var overview: String
    @Persisted var posterPathData: Data?
    @Persisted var releaseDate: String
    @Persisted var voteAverage: Double
    @Persisted var genreIDS: List<String> = List<String>()
    
    convenience init(id: Int, title: String, overview: String, posterPathData: Data, releaseDate: String, voteAverage: Double, genreIDS: [String]) {
        self.init()
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPathData = posterPathData
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        self.genreIDS.append(objectsIn: genreIDS)
    }
}
