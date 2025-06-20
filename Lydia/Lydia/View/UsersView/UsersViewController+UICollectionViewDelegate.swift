//
//  UsersViewController+t.swift
//  Lydia
//
//  Created by Reda Mimouni on 16/06/2025.
//

import UIKit

extension UsersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = randomUsers[indexPath.row]
        coordinator?.displayDetailView(for: user)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY > contentHeight - height * 1.5 {
            currentPage += 1
            fetchData(isPagination: true)
        }
    }
}
