//
//  ThemesController.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 8/14/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

class ThemesController: UIViewController {
    let themesView = ThemesView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        protocolSetups()
        enableSwipeAction()
    }
    
    override func loadView() {
        view = themesView
    }
    
    func protocolSetups(){
        themesView.colorTableView.dataSource = self
        themesView.colorTableView.delegate = self
        themesView.colorTableView.register(ColorsTableCell.self, forCellReuseIdentifier: "First")
    }
    
    func enableSwipeAction() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        view.addGestureRecognizer(edgePan)
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            let home = HomeController()
            home.modalTransitionStyle = .flipHorizontal
            present(home, animated: true)
        }
    }
}

extension ThemesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Theme.colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "First", for: indexPath) as! ColorsTableCell
        cell.setup(color: Theme.colors[indexPath.row].background)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            Theme.current = whiteTheme
        } else if indexPath.row == 1 {
            Theme.current = blackTheme
        } else if indexPath.row == 2 {
            Theme.current = blueTheme
        } else if indexPath.row == 3 {
            Theme.current = redTheme
        } else if indexPath.row == 4  {
            Theme.current = greenTheme
        } else if indexPath.row == 5 {
            Theme.current = purpleTheme
        } else if indexPath.row == 6 {
            Theme.current = pinkTheme
        } else {
            Theme.current = goldTheme
        }
        
        let home = HomeController()
        home.modalTransitionStyle = .flipHorizontal
        present(home, animated: true)
    }
}
