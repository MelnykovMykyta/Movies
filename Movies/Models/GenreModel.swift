//
//  GenreModel.swift
//  Movies
//
//  Created by Nikita Melnikov on 03.02.2024.
//

import Foundation

struct GenreList: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}
