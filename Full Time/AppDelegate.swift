import UIKit
import Login

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = ViewController()
        let mainViewController = LoginViewController(viewModel: .init())
//        let mainViewController = TabBarController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: mainViewController)
//        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
        return true
    }
}
