//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Ayan on 16.12.23.
//

import Foundation

enum MovieDetailItemType {
    case poster
    case title
    case info
    case description
    case cast
}

struct MovieDetailModel {
    let type: MovieDetailItemType
    let data: Any
}

struct MovieInfoModel {
    let rating: String
    let genre: [Genre]
    let length: String
    let language: String
    let rating2: String
}

class MovieDetailViewModel {
    
    private let manager = MovieDetailManager ()
    var items = [MovieDetailModel]()
    var movieID: Int
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    func getDetail() {
        manager.getMovieDetail(movieID: self.movieID) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(type: .poster, data: data.posterPath ?? ""))
                self.items.append(.init(type: .title, data: data.originalTitle ?? ""))
                self.items.append(.init(type: .info, data: MovieInfoModel(
                    rating: "\(data.voteAverage ?? 0)/10 IMDB",
                    genre: data.genres ?? [],
                    length: "\(data.runtime ?? 0) min",
                    language: data.originalLanguage ?? "",
                    rating2: "\(data.popularity ?? 0)")))
                self.success?()
            }
        }
    }

    func getCast() {
        
    }
}
