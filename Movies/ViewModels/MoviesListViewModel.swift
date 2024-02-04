//
//  MoviesListViewModel.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation
import RxSwift
import RxCocoa
import SDWebImage

class MoviesListViewModel {
    
    private let moviesListSubject = BehaviorSubject<MoviesList?>(value: nil)
    var moviesListObservable: Observable<MoviesList?> {
        return moviesListSubject.asObservable()
    }
    
    private var genres: [Genre] = []
    private let genreListSubject = BehaviorSubject<GenreList?>(value: nil)
    var genreListObservable: Observable<GenreList?> {
        return genreListSubject.asObservable()
    }
    
    private func getMoviesList(completion: @escaping (Result<MoviesList, Error>) -> Void) {
        let url = NetList.Urls.baseUrl + NetList.Points.popularMovies
        NetworkService.fetchData(url: url, parameters: NetList.Keys.parameters, completion: completion)
    }
    
    private func getGenreList(completion: @escaping (Result<GenreList, Error>) -> Void) {
        let url = NetList.Urls.baseUrl + NetList.Points.genres
        NetworkService.fetchData(url: url, parameters: NetList.Keys.parameters, completion: completion)
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
                self?.genres = genreListResponse.genres
                self?.genreListSubject.onNext(genreListResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func checkMovie(_ movie: Movie) {
        guard let movieFroDB = RealmDBService.getObjects(MovieDBObject.self).first(where: { $0.id == movie.id} ) else {
            addToFavorite(from: movie)
            return
        }
        RealmDBService.removeObject(movieFroDB)
    }
    
    private func addToFavorite(from movie: Movie) {
        let movieDB = MovieDBObject()
        let movieGenres = genres.filter { movie.genreIDS.contains($0.id) }.map { $0.name }
        
        movieDB.id = movie.id
        movieDB.title = movie.title
        movieDB.overview = movie.overview
        movieDB.releaseDate = movie.releaseDate
        movieDB.voteAverage = movie.voteAverage
        movieDB.genreIDS.append(objectsIn: movieGenres)
        
        guard let posterPathURL = URL(string: NetList.Urls.imageBaseUrl + movie.posterPath) else {
            movieDB.posterPathData = nil
            RealmDBService.addObject(object: movieDB)
            return
        }
        
        SDWebImageManager.shared.loadImage(
            with: posterPathURL,
            options: .highPriority,
            progress: nil
        ) { (image, _, _, _, _, _) in
            movieDB.posterPathData = image?.sd_imageData()
            RealmDBService.addObject(object: movieDB)
        }
    }
}
