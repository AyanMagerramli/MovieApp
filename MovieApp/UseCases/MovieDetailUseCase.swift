//
//  MovieDetailUseCase.swift
//  MovieApp
//
//  Created by Ayan on 16.12.23.
//

import Foundation

protocol MovieDetailUseCase {
    func getMovieDetail(movieID: Int, completion: @escaping((MovieDetail?, String?)->Void))
}
