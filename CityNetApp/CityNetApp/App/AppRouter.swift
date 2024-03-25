//
//  AppRouter.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        self.main()
    }

    func main() {
        let viewController = TabBarViewController()
        TabBarConfigurator.configure(viewController)
        self.window.rootViewController = viewController
        self.window.makeKeyAndVisible()
    }

}
