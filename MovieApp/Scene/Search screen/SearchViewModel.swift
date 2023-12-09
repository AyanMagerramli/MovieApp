//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Ayan on 09.12.23.
//

import Foundation

class SearchViewModel {
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var results = [MovieResult]()
    
    func getPeopleList(movieKey: String) {
        
        let param: [String: Any] = ["query": movieKey]
        
        NetworkManager.request(
            model: Movie.self,
            endpoint: Endpoints.searchMoviesEndpoint.rawValue,
            parameters: param )
        {
            data, error in
            if let error {
                self.error? (error)
            }else if let data {
                self.results = data.results ?? []
                self.success?()
            }
        }
    }
    
    func filterItemsForSearch(with searchText: String) {
        getPeopleList(movieKey: searchText)
    }
}
