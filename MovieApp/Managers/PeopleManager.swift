//
//  PeopleManager.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import Foundation

class PeopleManager: PeopleListUseCase {
    func getPeopleList(endpoint: Endpoints, completion: @escaping ((People?, String?) -> Void)) {
        NetworkManager.request(model: People.self, endpoint: endpoint.rawValue, completion: completion)
    }
}
