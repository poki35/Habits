//
//  SceneDelegate.swift
//  Habits
//
//  Created by Кирилл Пономаренко on 01.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    enum ScreenType {
        case habits
        case info
    }
    
    private enum Images {
        static let infoImage = UIImage(systemName: "info.circle.fill")
        static let habitsImage = UIImage(systemName: "rectangle.grid.1x2.fill")
    }
    
    let habitsViewController = HabitsViewController()
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        window.overrideUserInterfaceStyle = .light
        window.rootViewController = createTabBarController()
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
    func createNavigationBar(for screenType: ScreenType) -> UINavigationController {
        let navController: UINavigationController
        switch screenType {
        case .habits:
            let habitsVC = HabitsViewController()
            habitsVC.title = "habits"
            habitsVC.tabBarItem = UITabBarItem(title: "Привычки", image: Images.habitsImage, tag: 0)
            navController = UINavigationController(rootViewController: habitsVC)
        case .info:
            let infoVC = InfoViewController()
            infoVC.title = "Информация"
            infoVC.tabBarItem = UITabBarItem(title: "Информация", image: Images.infoImage, tag: 1)
            navController = UINavigationController(rootViewController: infoVC)
        }
        return navController
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemGray6
        UITabBar.appearance().tintColor = Colors.purple
        tabBarController.viewControllers = [
            createNavigationBar(for: .habits),
            createNavigationBar(for: .info)]
        return tabBarController
    }
}

extension UINavigationController {
    
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
}

