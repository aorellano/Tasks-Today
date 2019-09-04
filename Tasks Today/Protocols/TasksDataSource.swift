//
//  TasksDataSource.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 8/19/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class TasksDataSource: NSObject, UICollectionViewDataSource{
    let homeView = HomeView()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.taskModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeView.taskCollectionView.dequeueReusableCell(withReuseIdentifier: homeView.collectionCellId, for: indexPath) as! TaskCollectionCell
        
        cell.setup(taskModel: Data.taskModels[indexPath.row])
        return cell
    }
}
