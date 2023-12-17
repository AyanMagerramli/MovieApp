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
    case cast (String?)
}

struct MovieDetailModel {
    let type: MovieDetailItemType
}

struct MovieInfoModel {
    let genres: [Genre]
    let language: String
    let length: Int
    let rating: Double
    // let rating2: String
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
    
    func getDetail(completion: @escaping () -> Void) {
        manager.getMovieDetail(movieID: self.movieID) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(type: .poster(data.posterPath)))
                self.items.append(.init(type: .title(data.originalTitle)))
                self.items.append(.init(type: .description(data.overview)))
                self.items.append(.init(type: .info(MovieInfoModel(
                    genres: data.genres ?? [],
                    language: data.originalLanguage ?? "",
                    length: data.runtime ?? 0,
                    rating: data.voteAverage ?? 0))))
                self.items.append(.init(type: .cast(data.originalTitle)))
                completion()
            }
        }
    }
    
    
    func getGenres(completion: @escaping ([Genre]) -> Void) {
        var genres: [Genre] = []
        getDetail {
            for item in self.items {
                switch item.type {
                case .info(let infoModel):
                    genres.append(contentsOf: infoModel?.genres ?? [])
                default:
                    break
                }
            }
            completion(genres)
        }
    }
   
    func getCast() {
        
    }
}


//enum MovieeLanguage: String {
//    case ru
//    case en
//    
//    var language: String {
//        switch self {
//            
//        case .ru:
//            return "Russian"
//        case .en:
//            return "English"
//        }
//    }
//    
//}
