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
    func displayDetailView(for user: RandomUser)
}

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func displayUsersView() {
        let repository = RandomUsersFetcherRepositoryImplementation()
        let useCase = RandomUsersUseCase(randomUsersRepository: repository)
        let viewModel = RandomUsersViewModel(useCase: useCase)
        let viewController = UsersViewController(viewModel: viewModel)
        viewController.bindWith(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func displayDetailView(for user: RandomUser) {
        let viewController = DetailUserViewController(viewModel: DetailUserViewModel(user: user))
        navigationController.present(viewController, animated: true)
    }
}
