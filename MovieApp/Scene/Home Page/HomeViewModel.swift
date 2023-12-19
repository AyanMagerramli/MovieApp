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
    
    private let manager = HomeManager()
    var results = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var data: Movie?
    
    func getMovies() {
        getMovies(title: "Now Playing", endpoint: HomeEndpoint.nowPlayingEndpoint)
        getMovies(title: "Popular", endpoint: HomeEndpoint.popularEndpoint)
        getMovies(title: "Top-rated", endpoint: HomeEndpoint.topRatedEndpoint)
        getMovies(title: "Upcoming", endpoint: HomeEndpoint.upcomingEndpoint)
    }
    
    func getMovies(title: String, endpoint: HomeEndpoint) {
        manager.getMovieList(pageNumber: (data?.page ?? 0) + 1, endpoint: endpoint) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.results.append(.init(title: title, movies: data.results ?? []))
                self.data = data
                self.success?()
            }
        }
    }
}

