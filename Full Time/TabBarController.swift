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
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            // Установите желаемую высоту для таббара
            if let tabBarView = tabBar.subviews.first {
                tabBarView.translatesAutoresizingMaskIntoConstraints = false
                tabBarView.heightAnchor.constraint(equalToConstant: 500.0).isActive = true
            }
        }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: BoardsViewController(),
                image: UIImage(named: "boards")
            ),
            generateVC(
                viewController: CreateBoardViewController(),
                image: UIImage(named: "tasks")
            ),
            generateVC(
                viewController: ProfileViewController(),
                image: UIImage(named: "noti")
            ),
            generateVC(
                viewController: ProfileViewController(),
                image: UIImage(named: "user")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {

        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
    }
    
    
}
