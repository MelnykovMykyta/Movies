//
//  NetList.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation

struct NetList {
    
    struct Urls {
        static let baseUrl = "https://api.themoviedb.org"
        static let imageBaseUrl = "https://image.tmdb.org/t/p/original/"
    }
    
    struct Points {
        static let popularMovies = "/3/movie/popular"
        static let genres = "/3/genre/movie/list"
    }
    
    struct Keys {
        static let apiKey = "2ccc9fcb3e886fcb5f80015418735095"
        static let bearerToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyY2NjOWZjYjNlODg2ZmNiNWY4MDAxNTQxODczNTA5NSIsInN1YiI6IjY1Yjc0MTJiYTBiNjkwMDE3YmNlZjhmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Hhl93oP6hoKiYuXMis5VT-MVRfv1KZXhJjSncyCkhpw"
    }
}
