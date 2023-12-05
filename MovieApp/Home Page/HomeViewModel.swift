//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import Foundation

class HomeViewModel {
    
    var nowPlayingItem: NowPlayingResponseModel?
    var popularItem: Popular?
    var topratedItem: TopRated?
    var upcomingItem: Upcoming?
//    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    func getWelcomeItems(completion: @escaping (NowPlayingResponseModel?) -> Void ) {
        NetworkManager.request(
            model: NowPlayingResponseModel.self,
            endpoint: Endpoints.welcomeEndpoint.rawValue )
        {
            data, error in
            if let error {
                self.error? (error)
            } else {
                if let data = data {
                    self.nowPlayingItem = data
                    completion(self.nowPlayingItem)
                }
            }
        }
    }
   
    
    func getPopularMovies(completion: @escaping (Popular?) -> Void) {
        NetworkManager.request(
            model: Popular.self,
            endpoint: Endpoints.popularEndpoint.rawValue)
        {
            data, error in
            if let error {
                self.error? (error)
            } else {
                if let data = data {
                    self.popularItem = data
                    completion(self.popularItem)
                }
            }
        }
    }
    
    
    func getTopratedMovies(completion: @escaping (TopRated?) -> Void) {
        NetworkManager.request(
            model: TopRated.self,
            endpoint: Endpoints.topRatedEndpoint.rawValue)
        {
            data, error in
            if let error {
                self.error? (error)
            } else {
                if let data = data {
                    self.topratedItem = data
                    completion(self.topratedItem)
                }
            }
        }
    }
    
    
    func getUpcomingMovies(completion: @escaping (Upcoming?) -> Void) {
        NetworkManager.request(
            model: Upcoming.self,
            endpoint: Endpoints.upcomingEndpoint.rawValue)
        {
            data, error in
            if let error {
                self.error? (error)
            } else {
                self.upcomingItem = data
                completion(self.upcomingItem)
            }
        }
    }
}
