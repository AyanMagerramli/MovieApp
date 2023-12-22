//
//  PeopleMovieListManager.swift
//  MovieApp
//
//  Created by Ayan on 22.12.23.
//

import Foundation

class PeopleMovieListManager: PeopleMovieListUseCase {
    func getPeopleMovies(personID: Int, completion: @escaping((PeopleMovieList?, String?) -> Void)) {
        NetworkManager.request(
            model: PeopleMovieList.self,
            endpoint: "person/\(personID)/movie_credits",
            completion: completion)
    }    
}
