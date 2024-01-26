//
//  MainTabBarController.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/26/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let nav1 = UINavigationController(rootViewController: HomeViewController())
        let nav2 = UINavigationController(rootViewController: NewAndHotViewController())
        let nav3 = UINavigationController(rootViewController: DownloadViewController())
        
        nav1.tabBarItem.title = "홈"
        nav1.tabBarItem.image = UIImage(systemName: "house")
        nav1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        nav2.tabBarItem.title = "New & Hot"
        nav2.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle")
        nav2.tabBarItem.selectedImage = UIImage(systemName: "play.rectangle.on.rectangle.fill")
        
        nav3.tabBarItem.title = "저장한 콘텐츠 목록"
        nav3.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        nav3.tabBarItem.selectedImage = UIImage(systemName: "arrow.down.circle.fill")
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }
    

}
