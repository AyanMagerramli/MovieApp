//
//  MovieListForSearchUseCase.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import Foundation

protocol MovieListForSearchUseCase {
    func getMovieList (endpoint: SearchEndpoint, movieKey: String, completion: @escaping((Movie?, String?) -> Void))
}
