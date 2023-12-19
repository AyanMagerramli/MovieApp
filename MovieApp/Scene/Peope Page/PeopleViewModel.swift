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
    var peopleData: People?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPeopleList() {
        manager.getPeopleList(pageNumber: (peopleData?.page ?? 0) + 1) { data, error in
            if let error {
                self.error? (error)
            } else if let data {
                self.peopleData = data
                self.items.append(contentsOf: data.results ?? [])
                self.success? ()
            }
        }
    }
    
    func makePagination(index: Int) {
        //current page < total page
        if index == items.count-1 && (peopleData?.page ?? 0 <= peopleData?.totalPages ?? 0) {
            getPeopleList()
        }
    }
    
    //this is for pull to refresh
    func reset() {
        peopleData = nil
        items.removeAll()
    }
}

