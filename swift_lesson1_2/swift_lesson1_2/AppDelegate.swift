//
//  AppDelegate.swift
//  swift_lesson1_2
//
//  Created by 16817252 on 14/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		var findCarTabBarItem: UITabBarItem?

		var favorietsTabBarItem: UITabBarItem?
		if #available(iOS 13.0, *) {
			findCarTabBarItem = UITabBarItem(title: "Найти машину", image: UIImage(systemName: "magnifyingglass"), tag: 1)
		} else {
			findCarTabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
		}
		if #available(iOS 13.0, *) {
			favorietsTabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "star.fill"), tag: 1)
		} else {
			favorietsTabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
		}
//UITabBarItem(
		
		let rootViewController = LoadImageVC()
		let navViewController = UINavigationController.init(rootViewController: rootViewController)
		navViewController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

		navViewController.navigationBar.barTintColor = UIColor(red: 0.00, green: 0.38, blue: 1.00, alpha: 1.00)
		navViewController.navigationBar.isTranslucent = false
		navViewController.tabBarItem = findCarTabBarItem
		let carsViewController = FavoritesNaviganionController(rootViewController: CarsCollectionVC())
		carsViewController.tabBarItem = favorietsTabBarItem
		
		let tabBar = UITabBarController()
        tabBar.tabBar.barTintColor = UIColor(red: 11/255, green: 29/255, blue: 55/255, alpha: 1)
        tabBar.tabBar.tintColor = UIColor(red: 58/255, green: 131/255, blue: 241/255, alpha: 1)
        tabBar.tabBar.unselectedItemTintColor = .white
		tabBar.viewControllers = [navViewController, carsViewController]
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = tabBar
		window?.makeKeyAndVisible()

		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

