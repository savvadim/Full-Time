import UIKit
import Login

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = ViewController()
        let mainViewController = TabBarController()
//        let mainViewController = UINavigationController(rootViewController: LoginViewController())
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: viewController)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.window?.rootViewController = mainViewController
        }
        self.window?.makeKeyAndVisible()
        return true
    }
}
