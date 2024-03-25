//
//  TabBarViewController.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit
import CityNetUIkit

protocol TabBarDisplayLogic: AnyObject {}

final class TabBarViewController: UITabBarController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    
    var interactor: TabBarBusinessLogic?
    var router: (NSObjectProtocol & TabBarRoutingLogic & TabBarDataPassing)?
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addControllers()
        self.setupUI()
    }
  
    // MARK: - Private
    
    private func addControllers() {
        
        // Home
        let dashboardVC = DashboardViewController()
        let dashboardView = MainNavigation(rootViewController: DashboardConfigurator.configure(dashboardVC))
        dashboardView.tabBarItem = UITabBarItem()
        dashboardView.tabBarItem.title = "Ana səhifə"
        dashboardView.tabBarItem.image = UIImage(named: AppAssets.homeIcon.rawValue)
//        homeView.tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -3)
        
        
        let controllers = [dashboardView]
        self.viewControllers = controllers
    }
    
    private func addSubviews() {
        //self.updateConstraints()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = adaptiveColor(.main)
        self.tabBar.unselectedItemTintColor = adaptiveColor(.black)
    }
}

// MARK: - Display Logic

extension TabBarViewController: TabBarDisplayLogic {}
