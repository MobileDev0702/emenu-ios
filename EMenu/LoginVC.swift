//
//  ViewController.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdView: UIView!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    var lang = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
    }
    
    func initUI() {
        emailView.layer.cornerRadius = emailView.frame.size.height / 2
        emailView.layer.borderColor = UIColor.white.cgColor
        emailView.layer.borderWidth = 1
        emailView.clipsToBounds = true
        
        pwdView.layer.cornerRadius = pwdView.frame.size.height / 2
        pwdView.layer.borderColor = UIColor.white.cgColor
        pwdView.layer.borderWidth = 1
        pwdView.clipsToBounds = true
        
        signInBtn.layer.cornerRadius = 15
        signInBtn.layer.borderWidth = 1
        signInBtn.layer.borderColor = UIColor.white.cgColor
        signInBtn.clipsToBounds = true
    }

    @IBAction func onClickItalyBtn(_ sender: UIButton) {
        lang = "it"
        UserDefaults.standard.set(lang, forKey: "Language")
    }
    
    @IBAction func onClickSpainBtn(_ sender: UIButton) {
        lang = "es"
        UserDefaults.standard.set(lang, forKey: "Language")
    }
    
    @IBAction func onClickUKBtn(_ sender: UIButton) {
        lang = "en"
        UserDefaults.standard.set(lang, forKey: "Language")
    }
    
    @IBAction func onClickFranceBtn(_ sender: UIButton) {
        lang = "fr"
        UserDefaults.standard.set(lang, forKey: "Language")
    }
    
    @IBAction func onClickForgotPwdBtn(_ sender: UIButton) {
    }
    
    @IBAction func onClickSignInBtn(_ sender: UIButton) {
        if lang.isEmpty {
            showAlert(title: "Error", msg: "Select language")
        } else {
            let email = emailTextField.text!
            let pwd = pwdTextField.text!
            
            if !isValidEmail(email) {
                showAlert(title: "Error", msg: "Invalid email address!")
                return
            }
            let url = URL(string: "https://www.e-menu.tech/app/login.php")
            guard let requestUrl = url else { fatalError()}
            
            var request = URLRequest(url: requestUrl)
            request.httpMethod = "POST"
            let parameters : [String: Any] = [
                "lingua": lang,
                "email": email,
                "password": pwd,
                "device": "ANDROID"
            ]
            request.httpBody = parameters.percentEncoded();
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                DispatchQueue.main.async {
                    if let error = error {
                        print("Error took place \(error)")
                        return
                    }
                    
                    if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let resultObject = json["response"] as? [String: Any] {
                            let result = resultObject["result"] as? String
                            if result == "OK" {
                                self.performSegue(withIdentifier: "SignInToMainVC", sender: nil)
                            } else {
                                if let dataObject = json["data"] as? [String: Any] {
                                    let msg = dataObject["motivo"] as! String
                                    self.showAlert(title: "Error", msg: msg)
                                }
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    @IBAction func onClickSignupBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "SignInToSignUpVC", sender: nil)
    }
}

