//
//  PeopleListUseCase.swift
//  MovieApp
//
//  Created by Ayan on 15.12.23.
//

import Foundation

protocol PeopleListUseCase {
    func getPeopleList(endpoint: Endpoints,completion: @escaping((People?, String?) -> Void) )
}
