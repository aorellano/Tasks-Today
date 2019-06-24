//
//  HomeDataSource.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/12/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit
//
//class HomeDataSource: NSObject, UICollectionViewDataSource, UITableViewDataSource {
//    let homeView = HomeView()
//    
//    //CollectionView DataSource
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return Data.taskModels.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = homeView.taskCollectionView.dequeueReusableCell(withReuseIdentifier: homeView.collectionCellId, for: indexPath) as! TaskCollectionCell
//        
//        cell.setup(taskModel: Data.taskModels[indexPath.row])
//        
//        return cell
//    }
//    
//
//    
//    //TableView DataSource
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = homeView.todayTableView.dequeueReusableCell(withIdentifier: homeView.tableViewCellId, for: indexPath)
//        return cell
//    }
//}
