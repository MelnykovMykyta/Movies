//
//  String + DateExt.swift
//  Movies
//
//  Created by Nikita Melnikov on 04.02.2024.
//

import Foundation

extension String {
    
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: date)
    }
}
