//
//  NetworkService.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import Alamofire

class NetworkService {
    
    static func fetchData<T: Codable>(url: String, parameters: [String: Any], completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, parameters: parameters).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let responseData):
                completion(.success(responseData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
//    func fetchMoviesList(completion: @escaping (Result<MoviesList, Error>) -> Void) {
//        let url = NetList.Urls.baseUrl + NetList.Points.popularMovies
//        let parameters: [String: Any] = ["api_key": NetList.Keys.apiKey]
//        
//        AF.request(url, parameters: parameters).responseDecodable(of: MoviesList.self) { response in
//            switch response.result {
//            case .success(let movieListResponse):
//                completion(.success(movieListResponse))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//    
//    func fetchGenreList(completion: @escaping (Result<GenreList, Error>) -> Void) {
//        let url = NetList.Urls.baseUrl + NetList.Points.genres
//        let parameters: [String: Any] = ["api_key": NetList.Keys.apiKey]
//        
//        AF.request(url, parameters: parameters).responseDecodable(of: GenreList.self) { response in
//            switch response.result {
//            case .success(let genreListResponse):
//                completion(.success(genreListResponse))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
}
