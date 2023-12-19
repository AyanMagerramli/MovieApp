//
//  MovieDetailManager.swift
//  MovieApp
//
//  Created by Ayan on 16.12.23.
//

import Foundation

class MovieDetailManager: MovieDetailUseCase {
    func getMovieDetail(movieID: Int, completion: @escaping ((MovieDetail?, String?) -> Void)) {
        NetworkManager.request(model: MovieDetail.self, endpoint: MovieDetailEndpoint.movieDetailEndpoint.rawValue+"\(movieID)", completion: completion)
    }
}

