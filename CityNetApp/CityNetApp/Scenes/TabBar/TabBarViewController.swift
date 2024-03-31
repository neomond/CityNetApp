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
        dashboardView.barTintColor = adaptiveColor(.black)
        dashboardView.tabBarItem = UITabBarItem()
        dashboardView.tabBarItem.title = "Ana səhifə"
        dashboardView.tabBarItem.image = UIImage(named: AppAssets.homeIcon.rawValue)
        
        // Support
        let supportVC = SupportViewController()
        let supportView = MainNavigation(rootViewController: SupportConfigurator.configure(supportVC))
        supportView.tabBarItem = UITabBarItem()
        supportView.tabBarItem.title = "Dəstək"
        supportView.tabBarItem.image = UIImage(named: AppAssets.supportIcon.rawValue)
        
        // Tariffs
        let tariffsVC = TariffsViewController()
        let tariffsView = MainNavigation(rootViewController: TariffsConfigurator.configure(tariffsVC))
        tariffsView.tabBarItem = UITabBarItem()
        tariffsView.tabBarItem.title = "Tariflər"
        tariffsView.tabBarItem.image = UIImage(named: AppAssets.tagsIcon.rawValue)
        
        // More
//        let moreVC = MoreViewController()
//        let moreView = MainNavigation(rootViewController: MoreConfigurator.configure(moreVC))
//        moreView.tabBarItem = UITabBarItem()
//        moreView.tabBarItem.title = "Daha çox"
//        moreView.tabBarItem.image = UIImage(named: AppAssets.moreIcon.rawValue)
//        
        
        let tariffInfoVC = TariffInfoViewController()
        let tariffInfoView = MainNavigation(rootViewController: TariffInfoConfigurator.configure(tariffInfoVC))
        tariffInfoVC.tabBarItem = UITabBarItem()
        tariffInfoVC.tabBarItem.title = "Daha çox"
        tariffInfoVC.tabBarItem.image = UIImage(named: AppAssets.moreIcon.rawValue)
        
        let controllers = [dashboardView, supportView, tariffsView, tariffInfoView]
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
