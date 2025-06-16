//
//  UsersViewController.swift
//  Lydia
//
//  Created by Reda Mimouni on 16/06/2025.
//

import UIKit

final class UsersViewController: UIViewController, Coordinated {
    // MARK: - Subviews

    private lazy var collectionView: UICollectionView = createCollectionView()
    
    // MARK: - Dependencies

    internal weak var coordinator: MainCoordinator?

    func bindWith(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Init

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    // MARK: - Private
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }
    
    private func setupInterface() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}
