//
//  TabBarController.swift
//  Navigation
//
//  Created by Ekaterina Saveleva on 16.03.2023.
//

import UIKit

class TabBarController: UITabBarController {
    let firstVC = FeedViewController() // экземпляр класса
    let secondVC = ProfileViewController() // экземпляр класса
    
    override func viewDidLoad() {
        setupControllers() /// наша добавка из-за которой мы делаем override
        super.viewDidLoad()
        
        UINavigationBar.appearance().backgroundColor = .systemGray6
        ///UIBarButtonItem.appearance().tintColor = UIColor.red
        UITabBar.appearance().backgroundColor = .systemGray6
    }
    
    func setupControllers() {
        firstVC.tabBarItem.title = "Feed"
        firstVC.navigationItem.title = "Feed"
        secondVC.tabBarItem.title = "Profile"
        firstVC.tabBarItem.image = UIImage(systemName: "rectangle.grid.2x2")
        secondVC.tabBarItem.image = UIImage(systemName: "person.crop.circle") //создаем таб бар контролле
        let firstNavigationVC = UINavigationController(rootViewController: firstVC)
        let secondNavigationVC = UINavigationController(rootViewController: secondVC) // создаем навигейшн контроллеры
        viewControllers = [firstNavigationVC, secondNavigationVC] //
    }
}
