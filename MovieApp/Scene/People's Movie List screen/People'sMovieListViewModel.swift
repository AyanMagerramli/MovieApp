//
//  People'sMovieListViewModel.swift
//  MovieApp
//
//  Created by Ayan on 22.12.23.
//

import Foundation

class PeopleMovieListViewModel {
    
    private let manager = PeopleMovieListManager()
    var error: ((String) -> Void)?
    var success: (() -> Void)?
    var personID: Int
    var movies = [CastMembers?]()
    
    init( personID: Int) {
        self.personID = personID
    }
    
     func getMovies() {
        manager.getPeopleMovies( personID: self.personID) {
            data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.movies.append(contentsOf: data.cast ?? [])
                self.success?()
            }
        }
    }
}
