//
//  SideMenuVC.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
        
        if indexPath.row == 0 {
            cell.title.text = "Info"
        } else if indexPath.row == 1 {
            cell.title.text = "Visit our website"
        } else if indexPath.row == 2 {
            cell.title.text = "Work with us"
        } else if indexPath.row == 3 {
            cell.title.text = "Log in"
        } else if indexPath.row == 4 {
            cell.title.text = "Recovery password"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            dismiss(animated: true, completion: nil)
        } else if indexPath.row == 1 {
            
        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
            performSegue(withIdentifier: "MainToLoginVC", sender: nil)
        } else if indexPath.row == 4 {
            performSegue(withIdentifier: "MainToRecoveryVC", sender: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
