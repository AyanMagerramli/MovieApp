//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Ayan on 16.12.23.
//

import Foundation

enum MovieDetailItemType {
    case poster (String?) //done
    case title (String?) //done
    case info (MovieInfoModel?) //done
    case description (String?) //done
    case cast ([CastElement]?) //done
}

struct MovieDetailModel {
    let type: MovieDetailItemType
}

struct MovieInfoModel {
    let genres: [Genre]
    let language: String
    let length: Int
    let rating: Double
}

class MovieDetailViewModel {
    
    private let manager = MovieDetailManager()
    private let castManager  = CastManager()
    var items = [MovieDetailModel]()
    var movieID: Int
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    func getDetail() {
        manager.getMovieDetail(movieID: movieID) { [weak self] data, errorMessage in
            if let errorMessage {
                self?.error?(errorMessage)
            } else if let data {
                self?.items.append(.init(type: .poster(data.posterPath)))
                self?.items.append(.init(type: .title(data.originalTitle)))
                self?.items.append(.init(type: .description(data.overview)))
                self?.items.append(.init(type: .info(MovieInfoModel(
                    genres: data.genres ?? [],
                    language: data.originalLanguage ?? "",
                    length: data.runtime ?? 0,
                    rating: data.voteAverage ?? 0))))
                self?.getCast()
                self?.success?()
            }
        }
    }
    
    func getCast() {
        castManager.getCastDetail(movieID: self.movieID) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(type: .cast(data.cast)))
                self.success?()
            }
        }
    }
}
