//
//  LoginVC.swift
//  MealSercise
//
//  Created by user211625 on 7/23/22.
//  Author: Marcin Orgacki SN: 200467950
//  This view controller allows the user to login to the application.
//  Once the user fills out the fields, the info is checked against UserDefaults to see if user is registered.
//  If user exists, will be redirected to welcomVC, if does not exist, alertbox will display asking for correct credentials. It also features a register button for new users.
//

import UIKit

class LoginVC: UITableViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var textUsername: UITextField!
        
    @IBOutlet weak var textPassword: UITextField!
    
    var userName = ""
    var password = ""
      
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        
        // Assigns UserDefaults keys to variables
        let password = UserDefaults.standard.string(forKey: "password")
        let userName = UserDefaults.standard.string(forKey: "userName")
        
            // checks if textField matches UserDefaults keys
        if (textUsername.text == userName && textPassword.text == password) {
            
            let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomViewController
            welcomeVC.userName = textUsername.text!
            self.navigationController?.pushViewController(welcomeVC, animated: true)
            
        }else{
        // will display an alert box in case user input does not match UserDefaults keys
            
            let alert = UIAlertController(title: "Warning", message: "Please enter valid credentials", preferredStyle: .alert)
                
                 let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                 })
                 alert.addAction(ok)
                 let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
                 })
                 alert.addAction(cancel)
                 DispatchQueue.main.async(execute: {
                    self.present(alert, animated: true)
            })
        }
        
    }
    
    @IBAction func newAccountButton(_ sender: UIButton) {
        // takes user to the new account VC
        
        let newAccount = self.storyboard?.instantiateViewController(withIdentifier: "NewAccountVC") as! NewAccountVC
        self.navigationController?.pushViewController(newAccount, animated: true)
    }
}
