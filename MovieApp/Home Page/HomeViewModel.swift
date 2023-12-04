//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import Foundation

class HomeViewModel {
    var welcomeItem: WelcomeResponseModel?
    var popularItem: Popular?
    var topratedItem: TopRated?
    var upcomingItem: Upcoming?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    func getWelcomeItems() {
        NetworkManager.request(
            model: WelcomeResponseModel.self,
            endpoint: Endpoints.welcomeEndpoint.rawValue )
        {
            data, error in
            if let error {
                self.error? (error)
            } else {
                if let data = data {
                    self.welcomeItem = data
                   // print( self.welcomeItem?.results ?? "")
                    self.success?()
                }
            }
        }
    }
   
    
    func getPopularMovies() {
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
                    self.success?()
                }
            }
        }
    }
    
    
    func getTopratedMovies() {
        NetworkManager.request(
            model: TopRated.self,
            endpoint: Endpoints.topRatedEndpoint.rawValue)
        {
            data, error in
            if let error {
                self.error?(error)
            } else {
                if let data = data {
                    self.topratedItem = data
                    self.success?()
                }
            }
        }
    }
    
    
    func getUpcomingMovies() {
        NetworkManager.request(
            model: Upcoming.self,
            endpoint: Endpoints.upcomingEndpoint.rawValue)
        {
            data, error in
            if let error {
                self.error?(error)
            } else {
                self.upcomingItem = data
                self.success?()
            }
        }
    }
}
