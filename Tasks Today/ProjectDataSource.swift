//
//  CollectionViewDateSource.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/9/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class ProjectDataSource: NSObject, UICollectionViewDataSource, UITableViewDataSource {

    let homeView = HomeView()

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeView.taskCollectionView.dequeueReusableCell(withReuseIdentifier: homeView.collectionCellId, for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.todayTableView.dequeueReusableCell(withIdentifier: homeView.tableViewCellId, for: indexPath)
        return cell
    }
}
