//
//  UsersViewController.swift
//  Lydia
//
//  Created by Reda Mimouni on 16/06/2025.
//

import UIKit

final class UsersViewController: UIViewController, Coordinated {
    private let viewModel: RandomUsersViewModel
    internal var randomUsers: [RandomUser] = []
    
    // MARK: - Subviews

    private lazy var collectionView: UICollectionView = createCollectionView()
    
    // MARK: - Dependencies

    private weak var coordinator: MainCoordinator?

    func bindWith(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Init

    init(viewModel: RandomUsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        Task {
            do {
                randomUsers = try await viewModel.fetchRandomUsers()
                collectionView.reloadData()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    // MARK: - Private
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "UserCell")
        return collectionView
    }
    
    private func setupInterface() {
        title = "Random Users"
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
