//
//  SearchManager.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import Foundation

class SearchManager: MovieListForSearchUseCase {   
    func getMovieList(endpoint: Endpoints, movieKey: String, completion: @escaping ((Movie?, String?) -> Void)) {
        let param: [String: Any] = ["query": movieKey]
        NetworkManager.request(model: Movie.self, endpoint: endpoint.rawValue,parameters: param, completion: completion)
    }
}
