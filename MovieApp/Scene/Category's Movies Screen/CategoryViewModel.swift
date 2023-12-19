//
//  CategoryViewModel.swift
//  MovieApp
//
//  Created by Ayan on 17.12.23.
//

import Foundation

class CategoryViewModel {
    
    private let manager = HomeManager()
    
    var results = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var movieResults:[MovieResult] = []
    
    func getMovies(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        getMovies(title: "Now Playing", endpoint: Endpoints.nowPlayingEndpoint) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getMovies(title: "Popular", endpoint: Endpoints.popularEndpoint) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getMovies(title: "Top-rated", endpoint: Endpoints.topRatedEndpoint) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getMovies(title: "Upcoming", endpoint: Endpoints.upcomingEndpoint) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
    
    func getMovies(title: String, endpoint: Endpoints, completion: @escaping () -> Void) {
        manager.getMovieList(endpoint: endpoint) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.results.append(.init(title: title, movies: data.results ?? []))
                completion()
            }
        }
    }
}

    
 

