//
//  LoginVC.swift
//  MealSercise
//
//  Created by user211625 on 7/23/22.
//

import UIKit

class LoginVC: UITableViewController {
    
    
    @IBOutlet weak var textUsername: UITextField!
        
    @IBOutlet weak var textPassword: UITextField!
    
    var userName = ""
    var password = ""
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Do any additional setup after loading the view.
    }
    

    @IBAction func logInButton(_ sender: UIButton) {
        
        let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomViewController
        welcomeVC.userName = textUsername.text!
        self.navigationController?.pushViewController(welcomeVC, animated: true)
        
    }
    
    @IBAction func newAccountButton(_ sender: UIButton) {
        // takes user to the new account VC
        
        let newAccount = self.storyboard?.instantiateViewController(withIdentifier: "NewAccountVC") as! NewAccountVC
        self.navigationController?.pushViewController(newAccount, animated: true)
    }
}
