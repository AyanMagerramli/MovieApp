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
    case cast ([CastElement]?)
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
  //  private let peopleManager = PeopleManager()
    private let castManager  = CastManager()
    var items = [MovieDetailModel]()
    var movieID: Int
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    private var detailsFetched = false
    
    func getDetail(completion: @escaping () -> Void) {
        guard !detailsFetched else {
            completion()
            return
        }
        
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
                self.detailsFetched = true
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
    
    func getCast(completion: @escaping(([CastElement?]) -> Void)) {
        castManager.getCastDetail(movieID: self.movieID) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                let castMembers =
                self.items.append(.init(type: .cast(data.cast)))
                // Filter items array to only include CastElement type data
                            let castItems = self.items.compactMap { item in
                                if case .cast(let cast) = item.type {
                                    return cast
                                }
                                return nil
                            }.flatMap { $0 }
                completion(castItems)
            }
        }
    }
   
//    func getCast() {
//        peopleManager.getPeopleList(pageNumber: 2) { data, errorMessage in
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                self.items.append(.init(type: .cast(data.results)))
//            }
//        }
//    }
//    
//    func getCastMembers(completion: @escaping ([PeopleListResult]?) -> Void) {
//        self.getCast()
//        getDetail {
//            for item in self.items {
//                switch item.type {
//                case .cast(let cast):
//                    let knowForList = cast?.compactMap({ result in
//                        return result.knownFor?.first(where: {$0.id == self.movieID})
//                    })
//                    completion(cast)
//                default:
//                    break
//                }
//            }
//        }
//    }
}
