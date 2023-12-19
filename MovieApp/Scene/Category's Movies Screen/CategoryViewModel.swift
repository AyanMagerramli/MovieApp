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
    var data: Movie?
    var title: String?
    var endpoint: HomeEndpoint?
    
    func getMovies(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        getMovies(title: "Now Playing", endpoint: HomeEndpoint.nowPlayingEndpoint) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getMovies(title: "Popular", endpoint: HomeEndpoint.popularEndpoint) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getMovies(title: "Top-rated", endpoint: HomeEndpoint.topRatedEndpoint) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        getMovies(title: "Upcoming", endpoint: HomeEndpoint.upcomingEndpoint) {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
    
    func getMovies(title: String, endpoint: HomeEndpoint, completion: @escaping () -> Void) {
        manager.getMovieList(pageNumber: (data?.page ?? 0) + 1, endpoint: endpoint) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.results.append(.init(title: title, movies: data.results ?? []))
                self.data = data
                completion()
            }
        }
    }
    
    func makePagination(index: Int) {
        if index == results.count-1 && data?.page ?? 0 <= data?.totalPages ?? 0 {
            if let title = title,
               let endpoint = endpoint {
                getMovies(title: title, endpoint: endpoint ) {
                    // self.success?()
                }
            }
        }
    }
}

    
 

