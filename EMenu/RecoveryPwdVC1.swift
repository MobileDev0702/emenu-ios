//
//  RecoveryPwdVC1.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class RecoveryPwdVC1: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterBtn: UIButton!
    
    var lang: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        getData()
    }
    
    func getData() {
        lang = UserDefaults.standard.string(forKey: "Language")
    }
    
    func initUI() {
        emailTextField.layer.cornerRadius = emailTextField.frame.size.height / 2
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.clipsToBounds = true
        
        enterBtn.layer.cornerRadius = enterBtn.frame.size.height / 2
        enterBtn.layer.borderWidth = 1
        enterBtn.layer.borderColor = UIColor.black.cgColor
        enterBtn.clipsToBounds = true
    }
    
    @IBAction func onClickEnterBtn(_ sender: UIButton) {
        let email = emailTextField.text!
        if !isValidEmail(email) {
            showAlert(title: "Error", msg: "Invalid email address!")
            return
        }
        let url = URL(string: "https://www.e-menu.tech/app/reset_pwd2.php")
        guard let requestUrl = url else { fatalError()}
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let parameters : [String: Any] = [
            "lingua": lang!,
            "email": email,
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
                            self.performSegue(withIdentifier: "Recovery1To2VC", sender: nil)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
