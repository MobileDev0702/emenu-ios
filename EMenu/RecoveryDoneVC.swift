//
//  RecoveryDoneVC.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class RecoveryDoneVC: UIViewController {

    @IBOutlet weak var homeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    
    func initUI() {
        homeBtn.layer.cornerRadius = homeBtn.frame.size.height / 2
        homeBtn.layer.borderWidth = 1
        homeBtn.layer.borderColor = UIColor.black.cgColor
        homeBtn.clipsToBounds = true
    }
    
    @IBAction func onClickHomeBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "DoneToMainVC", sender: nil)
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
