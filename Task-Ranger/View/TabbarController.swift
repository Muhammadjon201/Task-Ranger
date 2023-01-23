//
//  TabbarController.swift
//  Task-Ranger
//
//  Created by ericzero on 1/22/23.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    func setUp(){
        
        let home = UINavigationController(rootViewController: HomeViewController())
        home.tabBarItem.selectedImage = UIImage(named: "boldHome")
        home.tabBarItem.image = UIImage(named: "lightHome")
        
        let calendar = UINavigationController(rootViewController: CalendarViewController())
        calendar.tabBarItem.selectedImage = UIImage(named: "boldCalendar")
        calendar.tabBarItem.image = UIImage(named: "lightCalendar")
        
        let profile = UINavigationController(rootViewController: ProfileViewController())
        profile.tabBarItem.selectedImage = UIImage(named: "boldProfile")
        profile.tabBarItem.image = UIImage(named: "lightProfile")
        
        tabBar.barTintColor = .blue
        tabBar.isTranslucent = false
                
        setViewControllers([home, calendar, profile], animated: true)
    }

}
