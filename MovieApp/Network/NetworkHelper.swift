//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by Ayan on 07.12.23.
//

import Foundation
import Alamofire

class NetworkHelper {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let imagePath = "https://image.tmdb.org/t/p/original"
    static let header: HTTPHeaders? = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NmY0MTg4ZGQzZGM3ZjIwNmFlYjhiZDI4Nzc0OTFkYiIsInN1YiI6IjY1NmFmMTI2ODgwNTUxMDEzYTQ3OTE1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gm44lL1anWWkmtdAYM87ZlanKMQwdYrgb7KU-S7_e5M"]
}
