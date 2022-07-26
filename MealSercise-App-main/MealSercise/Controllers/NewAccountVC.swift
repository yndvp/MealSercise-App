//
//  NewAccountVC.swift
//  MealSercise
//
//  Created by user211625 on 7/23/22.
//

import UIKit

class NewAccountVC: UITableViewController {
       
    
    @IBOutlet weak var textFullName: UITextField!
    
    @IBOutlet weak var textEmailAddress: UITextField!
    
    @IBOutlet weak var textNewUsername: UITextField!
    
    @IBOutlet weak var textNewPassword: UITextField!
    
    var fullName = ""
    var email = ""
    var userName = ""
    var password = ""
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAccountButton(_ sender: Any) {
        
        let newUser = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomViewController
        
    }
    
    @IBAction func logInButton(_ sender: Any) {
        // takes the user to the login view controller
        
        let logIn = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as!
        LoginVC
        self.navigationController?.pushViewController(logIn, animated: true)
    }
}
