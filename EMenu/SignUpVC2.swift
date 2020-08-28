//
//  SignUpVC2.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class SignUpVC2: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var enterBtn: UIButton!
    
    var code = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    
    func initUI() {
        phoneTextField.layer.cornerRadius = phoneTextField.frame.size.height / 2
        phoneTextField.layer.borderWidth = 1
        phoneTextField.layer.borderColor = UIColor.black.cgColor
        phoneTextField.clipsToBounds = true
        
        enterBtn.layer.cornerRadius = enterBtn.frame.size.height / 2
        enterBtn.layer.borderWidth = 1
        enterBtn.layer.borderColor = UIColor.black.cgColor
        enterBtn.clipsToBounds = true
    }
    
    @IBAction func onClickEnterBtn(_ sender: UIButton) {
        code = Int(arc4random_uniform(900000) + 100000)
        if phoneTextField.text!.isEmpty {
            showAlert(title: "Error", msg: "Input phone number!")
        } else {
            performSegue(withIdentifier: "Step2To3VC", sender: nil)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Step2To3VC" {
            if let destinationVC = segue.destination as? SignUpVC3 {
                destinationVC.code = "\(code)"
                destinationVC.phonenumber = phoneTextField.text!
            }
        }
    }
    

}
