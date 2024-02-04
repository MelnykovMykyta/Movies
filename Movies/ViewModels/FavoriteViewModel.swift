//
//  FavoriteViewModel.swift
//  Movies
//
//  Created by Nikita Melnikov on 04.02.2024.
//

import Foundation
import RealmSwift
import RxRealm
import RxCocoa
import RxSwift

class FavoriteViewModel {
    
    private let realm = try! Realm()
    
    func observeFavoriteMovies() -> Observable<[MovieDBObject]> {
        return Observable.collection(from: realm.objects(MovieDBObject.self))
            .map { results in
                return results.toArray()
            }
    }
    
    func getFavoriteMoviesList() -> [MovieDBObject] {
        return RealmDBService.getObjects(MovieDBObject.self)
    }
    
    func deleteFromFavorite(_ movie: MovieDBObject) {
        RealmDBService.removeObject(movie)
    }
}
