//
//  DetailUserViewController.swift
//  Lydia
//
//  Created by Reda Mimouni on 19/06/2025.
//

import UIKit

final class DetailUserViewController: UIViewController {
    
    private let viewModel: DetailUserViewModel
    
    // MARK: - UI
    
    private let imageView = UIImageView()
    private let stack = UIStackView()
    
    init(viewModel: DetailUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupLayout()
        loadImageIfNeeded(pictureData: viewModel.user.picture)
    }
    
    // MARK: - Private
    
    private func setupInterface() {
        let user = viewModel.user
        view.backgroundColor = .systemBackground
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        [
            makeLabel("Sexe : \(user.gender.capitalized)"),
            makeLabel("Nom : \(user.fullName)"),
            makeLabel("Adresse : \(user.address)"),
            makeLabel("Email : \(user.email)"),
            makeLabel("Téléphone : \(user.phone)")
        ].forEach {
            stack.addArrangedSubview($0)
        }

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
    }
    
    private func setupLayout() {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll)
        scroll.addSubview(imageView)
        scroll.addSubview(stack)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 24),
            imageView.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            
            stack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -24),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: -40),
            stack.widthAnchor.constraint(equalTo: scroll.widthAnchor, constant: -48) // to keep alignment
        ])
    }
    
    private func makeLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }
    
    private func loadImageIfNeeded(pictureData: Data?) {
        if let pictureData,
           let image = UIImage(data: pictureData) {
            imageView.image = image
        }
    }
}
