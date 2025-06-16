//
//  Coordinated.swift
//  Lydia
//
//  Created by Reda Mimouni on 16/06/2025.
//

import UIKit

protocol Coordinated where Self: UIViewController {
    func bindWith(coordinator: MainCoordinator)
}

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func displayUsersView()
}

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func displayUsersView() {
        let viewController = UsersViewController()
        viewController.bindWith(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
}
