//
//  MainCoordinatorTests.swift
//  Lydia
//
//  Created by Reda Mimouni on 20/06/2025.
//


import Testing
@testable import Lydia
import UIKit

@MainActor
@Suite
struct MainCoordinatorTests {
    @Test("displayUsersView push UsersViewController in navigation stack")
    func testDisplayUsersViewPushesUsersVC() {
        let nav = UINavigationController()
        let coordinator = MainCoordinator(navigationController: nav)
        
        coordinator.displayUsersView()
        
        #expect(nav.viewControllers.count == 1)
        #expect(nav.viewControllers.first is UsersViewController)
    }
    
    @Test("displayDetailView present DetailUserViewController modal")
    func testDisplayDetailViewPresentsModal() {
        let nav = UINavigationController()
        let coordinator = MainCoordinator(navigationController: nav)

        let dummyVC = UIViewController()
        nav.viewControllers = [dummyVC]
        let window = UIWindow()
        window.rootViewController = nav
        window.makeKeyAndVisible()

        let user = RandomUser(
            gender: "male",
            fullName: "John Doe",
            address: "123 Rue Fictive, Paris",
            email: "john@example.com",
            phone: "0601020304",
            picture: nil
        )

        coordinator.displayDetailView(for: user)

        let presented = nav.presentedViewController
        #expect(presented is DetailUserViewController)
    }
}
