//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import Foundation

struct HomeModel {
    let title: String
    let movies: [MovieResult]
}

class HomeViewModel {
    
    var results = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getMovies() {
        getMovies(title: "Now Playing", endpoint: Endpoints.nowPlayingEndpoint)
        getMovies(title: "Popular", endpoint: Endpoints.popularEndpoint)
        getMovies(title: "Top-rated", endpoint: Endpoints.topRatedEndpoint)
        getMovies(title: "Upcoming", endpoint: Endpoints.upcomingEndpoint)
    }
    
    func getMovies (title: String, endpoint: Endpoints) {
        NetworkManager.request(
            model: Movie.self,
            endpoint: endpoint.rawValue )
        {
            data, error in
            if let error {
                self.error? (error)
            } else {
                if let data = data {
                    self.results.append(.init(title: title, movies: data.results ?? []))
                    self.success?()
                }
            }
        }
    }
}

