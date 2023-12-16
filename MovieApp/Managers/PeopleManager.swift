//
//  PeopleManager.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import Foundation

class PeopleManager: PeopleListUseCase {
    func getPeopleList(pageNumber: Int, completion: @escaping ((People?, String?) -> Void)) {
        let url = Endpoints.popularPeople.rawValue + "?page=\(pageNumber)"
        NetworkManager.request(model: People.self, endpoint: url, completion: completion)
    }
}
