import UIKit
import Profile
import Boards
import Tasks
import Color
import Notify

open class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?, topInset: CGFloat) -> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.imageInsets = UIEdgeInsets(top: topInset, left: 0, bottom: -topInset, right: 0)
        return viewController
    }

    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: UINavigationController(rootViewController: BoardsViewController()),
                image: UIImage(named: "boards"),
                topInset: 13
            ),
            generateVC(
                viewController: UINavigationController(rootViewController: TasksViewController()),
                image: UIImage(named: "tasks"),
                topInset: 11
            ),
            generateVC(
                viewController: UINavigationController(rootViewController: NotificationViewController()),
                image: UIImage(named: "noti"),
                topInset: 13
            ),
            generateVC(
                viewController: UINavigationController(rootViewController: ProfileViewController()),
                image: UIImage(named: "user"),
                topInset: 13
            )
        ]
    }
    
    private func setTabBarAppearance() {
        tabBar.backgroundColor = UIColor.tabBlue
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.tabGrey
    }
}
