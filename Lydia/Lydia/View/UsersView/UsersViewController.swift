//
//  UsersViewController.swift
//  Lydia
//
//  Created by Reda Mimouni on 16/06/2025.
//

import UIKit

final class UsersViewController: UIViewController, Coordinated {
    internal let viewModel: RandomUsersViewModel
    internal var currentPage = 1
    
    // MARK: - Subviews

    private lazy var collectionView: UICollectionView = createCollectionView()
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Dependencies

    internal weak var coordinator: MainCoordinator?

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
        fetchData()
    }
    
    // MARK: - Internal
    
    internal func fetchData() {
        guard viewModel.isLoading == false else { return }
        Task {
            await viewModel.fetchRandomUsers(page: currentPage)
            collectionView.reloadData()
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
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCollectionViewCell.reuseIdentifier)
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        collectionView.refreshControl = refreshControl
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
    
    @objc
    private func refreshData() {
        currentPage = 1
        fetchData()
        refreshControl.endRefreshing()
    }
}
