//
//  UsersViewController+.swift
//  Lydia
//
//  Created by Reda Mimouni on 16/06/2025.
//

import UIKit

extension UsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCollectionViewCell ?? UserCollectionViewCell()
        let user = randomUsers[indexPath.item]
        cell.configure(with: user)
        return cell
    }
}
