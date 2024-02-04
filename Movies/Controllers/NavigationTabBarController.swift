//
//  NavigationTabBarController.swift
//  Movies
//
//  Created by Nikita Melnikov on 02.02.2024.
//

import Foundation
import UIKit

class NavigationTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        self.delegate = self
    }
}

private extension NavigationTabBarController {
    
    func setupViews() {
        
        tabBar.tintColor = D.Colors.standartTextColor
        tabBar.unselectedItemTintColor = D.Colors.tabBarUnselectTabColor
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        let moviesListNavigationController = NavigationBarController(rootViewController: ListVC())
        let favoritesNavigationController = NavigationBarController(rootViewController: FavoritesVC())
        
        moviesListNavigationController.tabBarItem = Tabs.moviesList.itemBar
        favoritesNavigationController.tabBarItem = Tabs.favorites.itemBar
        
        setViewControllers([moviesListNavigationController, favoritesNavigationController], animated: false)
        
        selectedIndex = Tabs.moviesList.rawValue
        
        let positionX: CGFloat = tabBar.bounds.width / 5
        let positionY: CGFloat = 8
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 2
        
        let round = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - positionY, width: width, height: height), cornerRadius: height / 3)
        
        round.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(round, at: 0)
        tabBar.itemWidth = width / 3
        tabBar.itemPositioning = .centered
        round.fillColor = D.Colors.tabBarColor.cgColor
    }
}

extension NavigationTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        Haptic.getHaptic()
    }
}
