//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let baseURL = "https://api.themoviedb.org/3/"
    static let header: HTTPHeaders? = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NmY0MTg4ZGQzZGM3ZjIwNmFlYjhiZDI4Nzc0OTFkYiIsInN1YiI6IjY1NmFmMTI2ODgwNTUxMDEzYTQ3OTE1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gm44lL1anWWkmtdAYM87ZlanKMQwdYrgb7KU-S7_e5M"]
    
    static func request<T: Codable>(
        model: T.Type,
        endpoint: String?,
        method: HTTPMethod = .get,
        encoding: ParameterEncoding = URLEncoding.default,
        completion: @escaping((T?, String?) -> Void))
    {
        AF.request("\(baseURL)\(endpoint ?? "")",
                   method: method,
                   encoding: encoding,
                   headers: header).responseDecodable(of: T.self) {
            response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}


