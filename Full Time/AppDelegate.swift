//
//  AppDelegate.swift
//  Full Time
//
//  Created by Vladislav Skuratov on 09.12.2022.
//

import UIKit
import Login
import Boards
import Profile

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Создание экрана загрузки
        let launchScreenView = UIView(frame: UIScreen.main.bounds)
        launchScreenView.backgroundColor = UIColor(red: 0.12, green: 0.12, blue: 0.28, alpha: 1)
        
        // Добавление изображения на экран загрузки
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 179, height: 168))
        logoImageView.center = launchScreenView.center
        logoImageView.image = UIImage(named: "logo")
        launchScreenView.addSubview(logoImageView)
        
        let viewController = TabBarController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: viewController)
        self.window?.makeKeyAndVisible()
        return true
    }
}

