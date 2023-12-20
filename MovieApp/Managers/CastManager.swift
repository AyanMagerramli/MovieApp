//
//  CastManager.swift
//  MovieApp
//
//  Created by Ayan on 20.12.23.
//

import Foundation
class CastManager: CastUseCase {
    func getCastDetail(movieID: Int, completion: @escaping ((Cast?, String?) -> Void)) {
        NetworkManager.request(
            model: Cast.self,
            endpoint: "movie/\(movieID)/credits",
            completion: completion)
    }
}
