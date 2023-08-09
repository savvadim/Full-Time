//
//  TabBarController.swift
//  Full Time
//
//  Created by Вадим Савосько on 09.08.2023.
//

import UIKit
import Profile
import Boards

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setTabBarAppearance()

    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: ProfileViewController(),
                image: UIImage(systemName: "person.fill")
            ),
            generateVC(
                viewController: BoardsViewController(),
                image: UIImage(systemName: "house.fill")
            ),
        ]
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        // Set tab bar background color to black
        
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UIColor.black.withAlphaComponent(1.0)
        tabBar.itemWidth = width / 3
        tabBar.itemPositioning = .centered
            
//            // Center-align tab bar item images
//            if let items = tabBar.items {
//                for item in items {
//                    item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
//                }
//            }
    }


    
    
    
}
