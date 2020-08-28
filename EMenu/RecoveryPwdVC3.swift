//
//  RecoveryPwdVC3.swift
//  EMenu
//
//  Created by WuSongBai on 2020/8/24.
//  Copyright © 2020 WuSongBai. All rights reserved.
//

import UIKit

class RecoveryPwdVC3: UIViewController {

    @IBOutlet weak var temporaryTextField: UITextField!
    @IBOutlet weak var newTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
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
        temporaryTextField.layer.cornerRadius = temporaryTextField.frame.size.height / 2
        temporaryTextField.layer.borderWidth = 1
        temporaryTextField.layer.borderColor = UIColor.black.cgColor
        temporaryTextField.clipsToBounds = true
        
        newTextField.layer.cornerRadius = newTextField.frame.size.height / 2
        newTextField.layer.borderWidth = 1
        newTextField.layer.borderColor = UIColor.black.cgColor
        newTextField.clipsToBounds = true
        
        repeatTextField.layer.cornerRadius = repeatTextField.frame.size.height / 2
        repeatTextField.layer.borderWidth = 1
        repeatTextField.layer.borderColor = UIColor.black.cgColor
        repeatTextField.clipsToBounds = true
        
        enterBtn.layer.cornerRadius = enterBtn.frame.size.height / 2
        enterBtn.layer.borderWidth = 1
        enterBtn.layer.borderColor = UIColor.black.cgColor
        enterBtn.clipsToBounds = true
    }
    
    @IBAction func onClickEnterBtn(_ sender: UIButton) {
        let pwd1 = temporaryTextField.text!
        let pwd2 = newTextField.text!
        let pwd3 = repeatTextField.text!
        
        let url = URL(string: "https://www.e-menu.tech/app/reset_pwd4.php")
        guard let requestUrl = url else { fatalError()}
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let parameters : [String: Any] = [
            "lingua": lang!,
            "pwd1": pwd1,
            "pwd2": pwd2,
            "pwd3": pwd3
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
                            self.performSegue(withIdentifier: "Recovery3ToDoneVC", sender: nil)
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
