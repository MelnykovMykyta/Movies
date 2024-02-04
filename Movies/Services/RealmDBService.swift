//
//  RealmDBService.swift
//  Movies
//
//  Created by Nikita Melnikov on 04.02.2024.
//

import Foundation
import RealmSwift
import RxRealm
import RxCocoa
import RxSwift

class RealmDBService {
    
    static let realm = try! Realm()
    
    static func addObject<T: Object>(object: T) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    static func getObjects<T: Object>(_ objectType: T.Type) -> [T] {
        let objects = realm.objects(objectType)
        return Array(objects)
    }
    
    static func removeObject<T: Object>(_ object: T) {
        try! realm.write {
            realm.delete(object)
        }
    }
}
