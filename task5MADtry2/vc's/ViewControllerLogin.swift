//
//  ViewControllerLogin.swift
//  task5MADtry2
//
//  Created by KriDan on 13.05.2021.
//

import UIKit


extension UITextField{
    func addUnderline(){
        let bottomLine = CALayer()
        bottomLine.backgroundColor = #colorLiteral(red: 0.7450980392, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        bottomLine.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 0.3)
        self.layer.addSublayer(bottomLine)
    }
}

class ViewControllerLogin: UIViewController, UITextFieldDelegate {

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextField = textField.superview?.viewWithTag(nextTag){
            nextField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        

        emailField.attributedPlaceholder = NSAttributedString(string: "  Email", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.7450980392, green: 0.7607843137, blue: 0.7607843137, alpha: 1)])
        
        passwordField.attributedPlaceholder = NSAttributedString(string: "  Пароль", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.7450980392, green: 0.7607843137, blue: 0.7607843137, alpha: 1)])
        
        emailField.addUnderline()
        passwordField.addUnderline()
        
        
        enterButton.layer.cornerRadius = 12
        // Do any additional setup after loading the view.
    }
    
    func saveUserData(email: String, password: String, token: String){
        let defaults = UserDefaults.standard
        defaults.setValue(email, forKey: "email")
        defaults.setValue(password, forKey: "password")
        defaults.setValue(token, forKey: "token")
    }

    func safeDataAndMoveFurther(_ data: SignInResponse){
        if data.token == nil {return}
        
        saveUserData(email: emailField.text!, password: passwordField.text!, token: data.token!)
        let vc = self.storyboard!.instantiateViewController(identifier: "tabBar")
        
        print("Login Success.")
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func login(){
        ApiClient().signIn(parameters: SignInRequest(email: emailField.text!, password: passwordField.text!)){ response in
            
            self.safeDataAndMoveFurther(response)
            
        }
    }
    
    @IBAction func enterButtonPressed() {
        if emailField.text == "" || !(emailField.text?.contains("@") ?? false){
            print("Invalid Email.")
            return
        }
        
        if passwordField.text == "" {
            print("Invalid Password.")
            return
        }
        
        login()
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
