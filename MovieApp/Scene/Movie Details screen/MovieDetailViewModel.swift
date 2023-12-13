//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Ayan on 12.12.23.
//

import Foundation

class MovieDetailViewModel {
    var items = [PeopleListResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPeopleList() {
        NetworkManager.request(
            model: People.self,
            endpoint: Endpoints.popularPeople.rawValue)
        {
            data, error in
            if let error {
                self.error? (error)
            }else if let data {
                self.items = data.results ?? []
                self.success?()
            }
        }
    }
}

