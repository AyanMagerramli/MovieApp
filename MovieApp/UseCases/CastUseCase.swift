//
//  CastUseCase.swift
//  MovieApp
//
//  Created by Ayan on 20.12.23.
//

import Foundation

protocol CastUseCase {
    func getCastDetail (movieID: Int, completion: @escaping((Cast?, String?)->Void))
}
