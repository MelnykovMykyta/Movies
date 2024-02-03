//
//  NetworkService.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import Alamofire

struct MoviesList: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalTitle, overview: String
    let posterPath, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

// MARK: - Genre
//struct GenreList: Codable {
//    let genres: [Genre]
//}
//
//struct Genre: Codable {
//    let id: Int
//    let name: String
//}

class NetworkService {
    
    let apiKey = "2ccc9fcb3e886fcb5f80015418735095"
    let bearerToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyY2NjOWZjYjNlODg2ZmNiNWY4MDAxNTQxODczNTA5NSIsInN1YiI6IjY1Yjc0MTJiYTBiNjkwMDE3YmNlZjhmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Hhl93oP6hoKiYuXMis5VT-MVRfv1KZXhJjSncyCkhpw"
    
    func fetchMoviesList(completion: @escaping (Result<MoviesList, Error>) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/popular"
        let parameters: [String: Any] = ["api_key": apiKey]
        
        AF.request(url, parameters: parameters).responseDecodable(of: MoviesList.self) { response in
            switch response.result {
            case .success(let movieListResponse):
                completion(.success(movieListResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
//    func fetchGenreList(genreId:[Int], completion: @escaping ([Genre]?, Error?) -> Void) {
//        let url = "https://api.themoviedb.org/3/genre/movie/list"
//        let parameters: [String: Any] = ["api_key": apiKey]
//        
//        AF.request(url, parameters: parameters).responseDecodable(of: GenreList.self) { response in
//            switch response.result {
//            case .success(let genreListResponse):
//                let genres = genreListResponse.genres
//                print(genres.count)
//                for genre in genres {
//                    print(genre)
//                }
//                completion(genres, nil)
//            case .failure(let error):
//                print(error.localizedDescription)
//                completion(nil, error)
//            }
//        }
//    }
}
