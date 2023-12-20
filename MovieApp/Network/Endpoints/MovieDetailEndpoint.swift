//
//  MovieDetailEndpoint.swift
//  MovieApp
//
//  Created by Ayan on 19.12.23.
//

import Foundation

enum MovieDetailEndpoint: String {
    case movieDetailEndpoint = "movie/"
    case castMembersEndpoint = "movie/{movie_id}/credits"
}
