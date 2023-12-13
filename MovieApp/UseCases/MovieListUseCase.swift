//
//  MovieListUseCase.swift
//  MovieApp
//
//  Created by Ayan on 13.12.23.
//

import Foundation

protocol MovieListUseCase {
    func getMovieList (endpoint: Endpoints, completion: @escaping((Movie?, String?) -> Void))
}
