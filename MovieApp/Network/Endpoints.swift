//
//  Endpoints.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import Foundation

enum Endpoints: String {
    case nowPlayingEndpoint = "movie/now_playing"
    case popularEndpoint = "movie/popular"
    case topRatedEndpoint = "movie/top_rated"
    case upcomingEndpoint = "movie/upcoming" 
    case popularPeople = "person/popular"
    case searchMoviesEndpoint = "search/movie?"
    case movieDetailEndpoint = "movie/"
}
