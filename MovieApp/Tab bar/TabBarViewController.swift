//
//  TabBarViewController.swift
//  MovieApp
//
//  Created by Ayan on 07.12.23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCOntrollers()
    }
    
    func setupViewCOntrollers() {
        let firstVC = HomeViewController()
        let homeNav = UINavigationController(rootViewController: firstVC)
        firstVC.tabBarItem.title = "Home"
        firstVC.tabBarItem.image = UIImage(named: "HomeTabItem")
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = PeopleViewController()
        let peopleNav = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem.title = "People"
        secondVC.tabBarItem.image = UIImage(named: "HomeTabItem")
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        viewControllers = [homeNav, peopleNav]
    }
}
