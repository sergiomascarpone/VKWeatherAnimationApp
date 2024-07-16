//
//  TabBarViewController.swift
//  VKTestApp
//
//  Created by Sergio Mascarpone on 16.07.24.
//

import UIKit


class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupViewControllers()
    }
    
    private func setupViewControllers() {
       
    }
}
