//
//  UsersViewController+.swift
//  Lydia
//
//  Created by Reda Mimouni on 16/06/2025.
//

import UIKit

extension UsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.reuseIdentifier, for: indexPath) as? UserCollectionViewCell ?? UserCollectionViewCell()
        let user = viewModel.users[indexPath.item]
        cell.configure(with: user)
        return cell
    }
}
