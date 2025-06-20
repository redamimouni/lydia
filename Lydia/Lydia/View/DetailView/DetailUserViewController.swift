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
    
    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()
    
    // MARK: - Init
    
    init(viewModel: DetailUserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupInterface()
    }
    
    // MARK: - Private
    
    private func setupInterface() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.axis = .vertical
        contentStack.spacing = 20
        contentStack.alignment = .center
        contentStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentStack)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            contentStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -48)
        ])

        if let picture = viewModel.user.picture {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 60
            imageView.clipsToBounds = true
            imageView.backgroundColor = .tertiarySystemFill
            imageView.image = UIImage(data: picture) ?? UIImage(systemName: "person.crop.circle")
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 128),
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            ])
            imageView.setContentHuggingPriority(.required, for: .vertical)
            imageView.setContentHuggingPriority(.required, for: .horizontal)
            contentStack.addArrangedSubview(imageView)
        }

        let nameLabel = UILabel()
        nameLabel.text = viewModel.user.fullName
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.numberOfLines = 0
        contentStack.addArrangedSubview(nameLabel)

        let genderView = infoRow(icon: "⚤", text: viewModel.user.gender.capitalized)
        let addressView = infoRow(icon: "🗺️", text: viewModel.user.address)
        let emailView = infoRow(icon: "📩", text: viewModel.user.email)
        let phoneView = infoRow(icon: "☎", text: viewModel.user.phone)

        contentStack.addArrangedSubview(genderView)
        contentStack.addArrangedSubview(addressView)
        contentStack.addArrangedSubview(emailView)
        contentStack.addArrangedSubview(phoneView)
    }
    
    private func infoRow(icon: String, text: String) -> UIStackView {
        let labelIcon = UILabel()
        labelIcon.text = icon

        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0

        let stack = UIStackView(arrangedSubviews: [labelIcon, label])
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
