//
//  MainNavigation.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 25.03.24.
//

import UIKit
import CityNetUIkit


final class MainNavigation: UINavigationController, ThemeableViewController {
    
    var theme: ThemeProvider = App.theme
    
    var barTintColor: UIColor? {
        didSet {
            if barTintColor == .clear {
                self.isTranslucent = true
                
                if #available(iOS 13.0, *) {
                    self.navigationBar.standardAppearance.backgroundColor = .clear
                    self.navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
                } else {
                    self.navigationBar.barTintColor = .clear
                }

                self.view.backgroundColor = .clear
                self.navigationBar.tintColor = .white
                
                self.isDarkContentBackground = false
            }
            else {
                self.isTranslucent = false
                
                if #available(iOS 13.0, *) {
                    self.navigationBar.standardAppearance.backgroundColor = barTintColor
                    self.navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
                } else {
                    self.navigationBar.barTintColor = barTintColor
                }
                
                self.navigationBar.tintColor = .black
                
                self.isDarkContentBackground = true
            }
        }
    }
    
    var isTranslucent: Bool? {
        didSet {
            self.navigationBar.isTranslucent = isTranslucent ?? false
        }
    }
    
    var isDarkContentBackground = true {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        if responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.delegate = self
            delegate = self
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if isDarkContentBackground {
            if #available(iOS 13.0, *) {
                return .darkContent
            } else {
                return .default
            }
        } else {
            return .lightContent
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.isEnabled = false
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    
    // MARK: - Private
    
    private func setupUI() {
        let titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.titleTextAttributes = titleTextAttributes
            appearance.shadowColor = .white
            self.navigationBar.standardAppearance = appearance
            self.navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        } else {
            self.navigationBar.barTintColor = .black
            self.navigationBar.titleTextAttributes = titleTextAttributes
        }
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = .black
    }
}

extension MainNavigation: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        interactivePopGestureRecognizer?.isEnabled = (responds(to: #selector(getter: interactivePopGestureRecognizer)) && viewControllers.count > 1)
    }
}

extension MainNavigation: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
