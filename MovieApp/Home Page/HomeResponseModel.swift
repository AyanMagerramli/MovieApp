//
//  HomeResponseModel.swift
//  MovieApp
//
//  Created by Ayan on 02.12.23.
//

import Foundation


// MARK: - NowPlayingResponseModel
struct NowPlayingResponseModel: Codable {
    let dates: DatesNowPlaying?
    let page: Int?
    let results: [NowPlayingResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct DatesNowPlaying: Codable {
    let maximum, minimum: String?
}

// MARK: - Result
struct NowPlayingResult: Codable, HomeCellProtocol {
    var ttle: String {
        title ?? ""
    }
    
    var img: String {
        "\(Endpoints.forImagePath.rawValue)\(posterPath ?? "")"
    }
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguageNowPlaying?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguageNowPlaying: String, Codable {
    case en = "en"
    case ja = "ja"
    case uk = "uk"
}


// MARK: - Popular
struct Popular: Codable {
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable, PopularCellProtocol {
    var ttle: String {
        title ?? ""
    }
    
    var img: String {
        "\(Endpoints.forImagePath.rawValue)\(posterPath ?? "")"
    }
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case ar = "ar"
    case en = "en"
    case ja = "ja"
    case mn = "mn"
}


// MARK: - TopRated
struct TopRated: Codable {
    let page: Int?
    let results: [ResultOfTopRated]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultOfTopRated: Codable, TopratedCellProtocol {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var ttle: String {
        title ?? ""
    }
    
    var img: String {
        "\(Endpoints.forImagePath.rawValue)\(posterPath ?? "")"
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

    // MARK: - Upcoming
    struct Upcoming: Codable {
        let dates: Dates?
        let page: Int?
        let results: [ResultForUpcoming]?
        let totalPages, totalResults: Int?

        enum CodingKeys: String, CodingKey {
            case dates, page, results
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
    }

    // MARK: - Dates
    struct Dates: Codable {
        let maximum, minimum: String?
    }

    // MARK: - Result
struct ResultForUpcoming: Codable, UpcomingCellProtocol {
    var ttle: String {
        title ?? ""
    }
    
    var img: String {
        "\(Endpoints.forImagePath.rawValue)\(posterPath ?? "")"
    }
    
        let adult: Bool?
        let backdropPath: String?
        let genreIDS: [Int]?
        let id: Int?
        let originalLanguage: OriginalLanguageForUpcoming?
        let originalTitle, overview: String?
        let popularity: Double?
        let posterPath, releaseDate, title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?
        

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIDS = "genre_ids"
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }

    enum OriginalLanguageForUpcoming: String, Codable {
        case en = "en"
        case fr = "fr"
        case ja = "ja"
        case zh = "zh"
    }


