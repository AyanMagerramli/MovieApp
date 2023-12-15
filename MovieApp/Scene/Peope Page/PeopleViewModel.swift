//
//  PeopleViewModel.swift
//  MovieApp
//
//  Created by Ayan on 08.12.23.
//

import Foundation

class PeopleViewModel {
    private let manager = PeopleManager()
    var items = [PeopleListResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
//    func getPeopleList() {
//        NetworkManager.request(
//            model: People.self,
//            endpoint: Endpoints.popularPeople.rawValue)
//        {
//            data, error in
//            if let error {
//                self.error? (error)
//            }else if let data {
//                self.items = data.results ?? []
//                self.success?()
//            }
//        }
//    }
    func getPeopleList() {
        manager.getPeopleList(endpoint: Endpoints.popularPeople) { data, error in
            if let error {
                self.error? (error)
            } else if let data {
                self.items = data.results ?? []
                self.success? ()
            }
        }
    }
}

