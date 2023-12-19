//
//  PeopleManager.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import Foundation

class PeopleManager: PeopleListUseCase {
    //we add here page number for Pagination, beacuse without pageNumber it always shows page 1.
    func getPeopleList(pageNumber: Int, completion: @escaping ((People?, String?) -> Void)) {
        let url = PeopleEndpoint.popularPeople.rawValue + "?page=\(pageNumber)"
        NetworkManager.request(model: People.self, endpoint: url, completion: completion)
    }
}
