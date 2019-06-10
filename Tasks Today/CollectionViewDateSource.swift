//
//  CollectionViewDateSource.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/9/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    let homeView = HomeView()
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: homeView.headerId, for: indexPath as IndexPath)
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath as IndexPath)
            footerView.backgroundColor = UIColor.green;
            return footerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeView.taskCollectionView.dequeueReusableCell(withReuseIdentifier: homeView.cellId, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
}
