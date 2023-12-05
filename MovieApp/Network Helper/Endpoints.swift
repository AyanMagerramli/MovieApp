//
//  Endpoints.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import Foundation

enum Endpoints: String {
    case forImagePath = "https://image.tmdb.org/t/p/original"
    case welcomeEndpoint = "movie/now_playing"
    case popularEndpoint = "movie/popular"
    case topRatedEndpoint = "movie/top_rated"
    case upcomingEndpoint = "movie/upcoming"    
}
