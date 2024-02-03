//
//  Tabs.swift
//  Movies
//
//  Created by Nikita Melnikov on 02.02.2024.
//

import Foundation
import UIKit

enum Tabs: Int {
    
    case moviesList
    case favorites
    
    var icon: UIImage {
        
        switch self {
        case .moviesList:
            return UIImage(systemName: "film") ?? UIImage()
        case .favorites:
            return UIImage(systemName: "heart.fill") ?? UIImage()
        }
    }
    
    var itemTitle: String {
        
        switch self {
        case .moviesList:
            return "Movies List"
        case .favorites:
            return "Favorites"
        }
    }
    
    var itemBar: UITabBarItem {
        
        switch self {
        case .moviesList:
            return UITabBarItem(title: Tabs.moviesList.itemTitle, image: Tabs.moviesList.icon, tag: Tabs.moviesList.rawValue)
        case .favorites:
            return  UITabBarItem(title: Tabs.favorites.itemTitle, image: Tabs.favorites.icon, tag: Tabs.favorites.rawValue)
        }
    }
}
