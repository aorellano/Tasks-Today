//
//  TextFieldView.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/9/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeView: UIView {
    let cellId = "Cell"
    let headerId = "HeaderCell"
    var taskCollectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
    
    var textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.masksToBounds = false
        tf.textAlignment = .center
        tf.placeholder = "Enter Task"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionViewLayout()
        
        taskCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        taskCollectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)

        textFieldConstraints()
        collectionViewConstraints()
    }
    
    func collectionViewLayout() {
        flowLayout.headerReferenceSize = CGSize(width: 100, height: 80)
        taskCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    }

    func textFieldConstraints() {
        self.addSubview(textField)
        textField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func collectionViewConstraints(){
        self.addSubview(taskCollectionView)
        taskCollectionView.translatesAutoresizingMaskIntoConstraints = false
        taskCollectionView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        taskCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        taskCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        taskCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

