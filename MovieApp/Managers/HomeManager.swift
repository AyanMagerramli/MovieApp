//
//  HomeManager.swift
//  MovieApp
//
//  Created by Ayan on 13.12.23.
//

import Foundation

class HomeManager: MovieListUseCase {
    func getMovieList(pageNumber: Int, endpoint: HomeEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkManager.request(
            model: Movie.self,
            endpoint: endpoint.rawValue,
            completion: completion)
    }
}

//class HomeManager: MovieListUseCase {
//    func getMovieList(pageNumber: Int, endpoint: HomeEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
//        NetworkManager.request(
//            model: Movie.self,
//            endpoint: endpoint.rawValue,
//            completion: completion)
//    }


//}

//class HomeManager: MovieListUseCase {
//    func getMovieList(pageNumber: Int, endpoint: HomeEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
//        NetworkManager.request(
//            model: Movie.self,
//            endpoint: endpoint.rawValue,
//            completion: completion)
//    }


//}

//class HomeManager: MovieListUseCase {
//    func getMovieList(pageNumber: Int, endpoint: HomeEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
//        NetworkManager.request(
//            model: Movie.self,
//            endpoint: endpoint.rawValue,
//            completion: completion)
//    }


//}

//class HomeManager: MovieListUseCase {
//    func getMovieList(pageNumber: Int, endpoint: HomeEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
//        NetworkManager.request(
//            model: Movie.self,
//            endpoint: endpoint.rawValue,
//            completion: completion)
//    }


//}
