//
//  MainPageController.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 22.11.22.
//

import UIKit

final class TabBarController: UITabBarController {
    
    
    let colorsManager = ColorsManager.self
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarVC()
        setTabBar()        
    }
    
    private func setNavigationVC(controller: UIViewController, itemName: String, itemImage: String, itemSelectedImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(named: itemImage), selectedImage: UIImage(named: itemSelectedImage))
        let navigationVC = UINavigationController(rootViewController: controller)
        navigationVC.tabBarItem = item
        return navigationVC
        
    }
    
    private func setTabBarVC() {
        let mainPageVC = setNavigationVC(controller: MainPageController(), itemName: "", itemImage: "MainPage", itemSelectedImage: "MainPageFilled")
        let newsVC = setNavigationVC(controller: NewsViewController(), itemName: "", itemImage: "News", itemSelectedImage: "NewsFilled")
        let LemongrassVC = setNavigationVC(controller: CollectionTypeTableViewController(collectionType: CollectionTypeViewModel(firestoreService: FirestoreNetworkService()), collection: CollectionTypeModel()), itemName: "", itemImage: "Lemongrass", itemSelectedImage: "LemongrassFilled")
        let jobVC = setNavigationVC(controller: JobViewController(), itemName: "", itemImage: "Job", itemSelectedImage: "JobFilled")
        let settingsVC = setNavigationVC(controller: SettingsViewController(), itemName: "", itemImage: "Settings", itemSelectedImage: "SettingsFilled")
        
        viewControllers = [mainPageVC, newsVC, LemongrassVC, jobVC, settingsVC]
        
        
    }
    
    private func setTabBar() {
        
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = colorsManager.lemongrassColor
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Apple SD Gothic Neo Medium", size: 14)]
        
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            guard let barItemView = item.value(forKey: "view") as? UIView else { return }

            let timeInterval: TimeInterval = 0.3
            let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
                barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
            }
            propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
            propertyAnimator.startAnimation()
        }
    
}
