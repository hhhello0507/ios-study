//
//  MainVC.swift
//  uikit-playground
//
//  Created by dgsw8th71 on 3/12/24.
//

import Foundation
import UIKit

class MainVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let homeVC = HomeVC()
        let searchVC = SearchVC()
        let profileVC = ProfileVC()
        
        homeVC.title = "홈"
        searchVC.title = "검색"
        profileVC.title = "프로필"
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        profileVC.navigationItem.largeTitleDisplayMode = .always
        
        homeVC.tabBarItem.image = UIImage.init(systemName: "house")
        searchVC.tabBarItem.image = UIImage.init(systemName: "magnifyingglass")
        profileVC.tabBarItem.image = UIImage.init(systemName: "book")
        
        let navigationHome = UINavigationController(rootViewController: homeVC)
        let navigationSearch = UINavigationController(rootViewController: searchVC)
        let navigationProfile = UINavigationController(rootViewController: profileVC)
        
        navigationHome.navigationBar.prefersLargeTitles = true
        navigationSearch.navigationBar.prefersLargeTitles = true
        navigationProfile.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navigationHome, navigationSearch, navigationProfile], animated: false)
    }
}
