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
                viewController: UINavigationController(rootViewController: BoardsViewController()),
                image: UIImage(named: "boards")
            ),
            generateVC(
                viewController: UINavigationController(rootViewController: CreateBoardViewController()),
                
                image: UIImage(named: "tasks")
            ),
            generateVC(
                viewController: UINavigationController(rootViewController: ProfileViewController()),
                image: UIImage(named: "noti")
            ),
            generateVC(
                viewController: UINavigationController(rootViewController: ProfileViewController()),
                image: UIImage(named: "user")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController , image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
    }
}
