//
//  PeopleMovieListUseCase.swift
//  MovieApp
//
//  Created by Ayan on 22.12.23.
//

import Foundation

protocol PeopleMovieListUseCase {
    func getPeopleMovies (personID: Int, completion: @escaping((PeopleMovieList?, String?) -> Void))
}
