//
//  Coordinator.swift
//  MovieApp
//
//  Created by Ayan on 12.12.23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
