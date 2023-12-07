//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static func request<T: Codable>(
        model: T.Type,
        endpoint: String?,
        method: HTTPMethod = .get,
        encoding: ParameterEncoding = URLEncoding.default,
        completion: @escaping((T?, String?) -> Void))
    {
        AF.request("\(NetworkHelper.baseURL)\(endpoint ?? "")",
                   method: method,
                   encoding: encoding,
                   headers: NetworkHelper.header).responseDecodable(of: T.self) {
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


