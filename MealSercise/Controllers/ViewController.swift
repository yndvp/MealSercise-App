//
//  ViewController.swift
//  MealSercise
//
//  Created by user211625 on 7/23/22.
//

import UIKit

class ViewController: UIViewController {
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logInButton(_ sender: UIButton) {
        // takes the user to the login VC
        
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func newAccountButton(_ sender: UIButton) {
        // takes the user to the new account VC
        
        let newAccountVC = self.storyboard?.instantiateViewController(withIdentifier: "NewAccountVC") as! NewAccountVC
        self.navigationController?.pushViewController(newAccountVC, animated: true)
    }
    
}

