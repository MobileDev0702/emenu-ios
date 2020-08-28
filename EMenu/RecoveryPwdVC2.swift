//
//  RecoveryPwdVC2.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class RecoveryPwdVC2: UIViewController {

    @IBOutlet weak var continueBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    
    func initUI() {
        continueBtn.layer.cornerRadius = continueBtn.frame.size.height / 2
        continueBtn.layer.borderWidth = 1
        continueBtn.layer.borderColor = UIColor.black.cgColor
        continueBtn.clipsToBounds = true
    }
    
    @IBAction func onClickContinueBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "Recovery2To3VC", sender: nil)
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
