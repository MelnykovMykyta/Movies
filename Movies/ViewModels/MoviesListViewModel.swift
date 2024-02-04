//
//  MoviesListViewModel.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import RxSwift
import RxCocoa

class MoviesListViewModel {
    
    private let moviesListSubject = BehaviorSubject<MoviesList?>(value: nil)
    var moviesListObservable: Observable<MoviesList?> {
        return moviesListSubject.asObservable()
    }
    
    private let genreListSubject = BehaviorSubject<GenreList?>(value: nil)
    var genreListObservable: Observable<GenreList?> {
        return genreListSubject.asObservable()
    }
    
    
    private func getMoviesList(completion: @escaping (Result<MoviesList, Error>) -> Void) {
        let url = NetList.Urls.baseUrl + NetList.Points.popularMovies
        let parameters: [String: Any] = ["api_key": NetList.Keys.apiKey]
        NetworkService.fetchData(url: url, parameters: parameters, completion: completion)
    }
    
    private func getGenreList(completion: @escaping (Result<GenreList, Error>) -> Void) {
        let url = NetList.Urls.baseUrl + NetList.Points.genres
        let parameters: [String: Any] = ["api_key": NetList.Keys.apiKey]
        NetworkService.fetchData(url: url, parameters: parameters, completion: completion)
    }
    
    func fetchData() {
        getMoviesList { [weak self] result in
            switch result {
            case .success(let movieListResponse):
                self?.moviesListSubject.onNext(movieListResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        getGenreList { [weak self] result in
            switch result {
            case .success(let genreListResponse):
                self?.genreListSubject.onNext(genreListResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
