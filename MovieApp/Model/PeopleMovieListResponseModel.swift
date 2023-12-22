//
//  PeopleMovieListResponseModel.swift
//  MovieApp
//
//  Created by Ayan on 22.12.23.
//

import Foundation
// MARK: - PeopleMovieList
struct PeopleMovieList: Codable {
    let cast, crew: [CastMembers]?
    let id: Int?
}

// MARK: - Cast
struct CastMembers: Codable, HomeCellProtocol {
    var ttle: String {
        originalTitle ?? ""
    }
    
    var img: String {
        posterPath ?? ""
    }
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let department, job: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}


