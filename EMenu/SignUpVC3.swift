//
//  SignUpVC3.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class SignUpVC3: UIViewController {

    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    var code: String!
    
    var lang: String!
    var fname: String!
    var lname: String!
    var email: String!
    var pwd: String!
    var address: String!
    var zipcode: String!
    var city: String!
    var country: String!
    var phonenumber: String!
    var contract: String!
    var disclaimer: String!
    var privacy: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        getData()
    }
    
    func initUI() {
        codeTextField.layer.cornerRadius = codeTextField.frame.size.height / 2
        codeTextField.layer.borderWidth = 1
        codeTextField.layer.borderColor = UIColor.black.cgColor
        codeTextField.clipsToBounds = true
        
        sendBtn.layer.cornerRadius = codeTextField.frame.size.height / 2
        sendBtn.layer.borderWidth = 1
        sendBtn.layer.borderColor = UIColor.black.cgColor
        sendBtn.clipsToBounds = true
    }
    
    func getData() {
        lang = UserDefaults.standard.string(forKey: "Language")
        fname = UserDefaults.standard.string(forKey: "FName")
        lname = UserDefaults.standard.string(forKey: "LName")
        email = UserDefaults.standard.string(forKey: "Email")
        pwd = UserDefaults.standard.string(forKey: "Pwd")
        address = UserDefaults.standard.string(forKey: "Address")
        zipcode = UserDefaults.standard.string(forKey: "Zipcode")
        city = UserDefaults.standard.string(forKey: "City")
        country = UserDefaults.standard.string(forKey: "Country")
        contract = UserDefaults.standard.string(forKey: "Contract")
        disclaimer = UserDefaults.standard.string(forKey: "Disclaimer")
        privacy = UserDefaults.standard.string(forKey: "Privacy")
    }
    
    @IBAction func onClickSendBtn(_ sender: UIButton) {
        if code == codeTextField.text! {
            let url = URL(string: "https://www.e-menu.tech/app/registrazione1.php")
            guard let requestUrl = url else { fatalError()}
            
            var request = URLRequest(url: requestUrl)
            request.httpMethod = "POST"
            let parameters : [String: Any] = [
                "lingua": lang!,
                "cognome": lname!,
                "nome": fname!,
                "email": email!,
                "password1": pwd!,
                "password2": pwd!,
                "indirizzo": address!,
                "cap": zipcode!,
                "citta": city!,
                "provincia": country!,
                "telefono": phonenumber!,
                "esonero": contract!,
                "clausole": disclaimer!,
                "privacy": privacy!
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
                                self.performSegue(withIdentifier: "Step3ToValidationVC", sender: nil)
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
        } else {
            showAlert(title: "Error", msg: "Verification Code is wrong!")
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
