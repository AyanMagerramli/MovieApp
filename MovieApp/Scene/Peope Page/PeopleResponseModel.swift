//
//  PeopleResponseModel.swift
//  MovieApp
//
//  Created by Ayan on 08.12.23.
//

import Foundation


import Foundation

// MARK: - People
struct People: Codable {
    let page: Int?
    let results: [PeopleListResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PeopleListResult: Codable, HomeCellProtocol {
    var ttle: String {
        name ?? ""
    }
    
    var img: String {
        "\(NetworkHelper.imagePath)\(profilePath ?? "")"
    }
    
    let adult: Bool?
    let gender, id: Int?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
    }
}

