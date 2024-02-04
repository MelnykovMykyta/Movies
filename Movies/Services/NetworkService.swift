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
}
