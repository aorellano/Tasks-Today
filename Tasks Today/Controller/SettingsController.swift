//
//  SettingsController.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 8/14/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    let settingsView = SettingsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView.settingsTableView.dataSource = self
        settingsView.settingsTableView.delegate = self
        settingsView.settingsTableView.register(SettingsTableCell.self, forCellReuseIdentifier: "Cell")
        settingsView.settingsTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    override func loadView() {
        view = settingsView
    }
}


extension SettingsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        } else {
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SettingsTableCell
        
        if indexPath.section == 0 {
            cell.title("More Themes!")
        } else if indexPath.section == 1{
            if indexPath.row == 0{
                cell.title("Get in Touch")
            } else {
                cell.title("Share the App")
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0{
                cell.title("Instagram")
            } else if indexPath.row == 1 {
                cell.title("Twitter")
            } else {
                cell.title("Medium")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        header?.contentView.backgroundColor = Theme.current.background
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let themesVC = ThemesController()
            present(themesVC, animated: true)
        }
    }
    
}
