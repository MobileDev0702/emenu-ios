//
//  SignUpVC.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class SignUpVC1: UIViewController {

    @IBOutlet weak var fnameTextField: UITextField!
    @IBOutlet weak var lnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var confirmpwdTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var contractBtn: UIButton!
    @IBOutlet weak var disclaimerBtn: UIButton!
    @IBOutlet weak var privacyBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var contractSwitch: UISwitch!
    @IBOutlet weak var disclaimerSwitch: UISwitch!
    @IBOutlet weak var privacySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    
    func initUI() {
        contractBtn.layer.cornerRadius = 15
        contractBtn.layer.borderWidth = 1
        contractBtn.layer.borderColor = UIColor.black.cgColor
        contractBtn.clipsToBounds = true
        
        disclaimerBtn.layer.cornerRadius = 15
        disclaimerBtn.layer.borderWidth = 1
        disclaimerBtn.layer.borderColor = UIColor.black.cgColor
        disclaimerBtn.clipsToBounds = true
        
        privacyBtn.layer.cornerRadius = 15
        privacyBtn.layer.borderWidth = 1
        privacyBtn.layer.borderColor = UIColor.black.cgColor
        privacyBtn.clipsToBounds = true
        
        nextBtn.layer.cornerRadius = nextBtn.frame.size.height / 2
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.borderColor = UIColor.black.cgColor
        nextBtn.clipsToBounds = true
    }
    
    @IBAction func onClickNextBtn(_ sender: UIButton) {
        if fnameTextField.text!.isEmpty {
            showAlert(title: "Error", msg: "Input first name!")
            return
        } else {
            UserDefaults.standard.set(fnameTextField.text, forKey: "FName")
        }
        
        if lnameTextField.text!.isEmpty {
            showAlert(title: "Error", msg: "Input last name!")
            return
        } else {
            UserDefaults.standard.set(lnameTextField.text, forKey: "LName")
        }
        
        if emailTextField.text!.isEmpty {
            showAlert(title: "Error", msg: "Input email!")
            return
        } else {
            UserDefaults.standard.set(emailTextField.text, forKey: "Email")
        }
        
        if pwdTextField.text!.isEmpty || pwdTextField.text!.count < 8 {
            showAlert(title: "Error", msg: "Password must contatin at least 8 characters!")
            return
        } else {
            UserDefaults.standard.set(pwdTextField.text, forKey: "Pwd")
        }
        
        if pwdTextField.text != confirmpwdTextField.text {
            showAlert(title: "Error", msg: "Password differs from confirmation!")
            return
        }
        
        if addressTextField.text!.isEmpty {
            showAlert(title: "Error", msg: "Input address!")
        } else {
            UserDefaults.standard.set(addressTextField.text, forKey: "Address")
        }
        
        if zipcodeTextField.text!.isEmpty {
            showAlert(title: "Error", msg: "Input zipcode!")
        } else {
            UserDefaults.standard.set(zipcodeTextField.text, forKey: "Zipcode")
        }
        
        if cityTextField.text!.isEmpty {
            showAlert(title: "Error", msg: "Input city!")
        } else {
            UserDefaults.standard.set(cityTextField.text, forKey: "City")
        }
        
        if countryTextField.text!.isEmpty {
            showAlert(title: "Error", msg: "Input country!")
        } else {
            UserDefaults.standard.set(countryTextField.text, forKey: "Country")
        }
        
        let contract = contractSwitch.isOn ? "ok" : ""
        if contract.isEmpty {
            showAlert(title: "Error", msg: "Terms of contract must be checked for acknowledgement!")
        } else {
            UserDefaults.standard.set(contract, forKey: "Contract")
        }
        
        let disclaimer = disclaimerSwitch.isOn ? "ok" : ""
        if disclaimer.isEmpty {
            showAlert(title: "Error", msg: "Disclaimer must be checked for acknowledgement!")
        } else {
            UserDefaults.standard.set(disclaimer, forKey: "Disclaimer")
        }
        
        let privacy = privacySwitch.isOn ? "ok" : ""
        if privacy.isEmpty {
            showAlert(title: "Error", msg: "Privacy must be checked for acknowledgement!")
        } else {
            UserDefaults.standard.set(privacy, forKey: "Privacy")
        }
        
        performSegue(withIdentifier: "Step1To2VC", sender: nil)
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
