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
    var newUser = ""
    var password = ""
     
    // Reference to managed object context. Is a reference to the CoreData view context.
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Data for the table
    var userInfo:[NewUser]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchInfo()
        
    }
    
    // Will retrieve info from Core Data
    func fetchInfo() {
        
        do{
            self.userInfo = try context.fetch(NewUser.fetchRequest())
            // makes the main thread handle the update and reload of the UI to save resources.
            DispatchQueue.main.async {
                self.tableView.reloadData()// reloads the tableview upon receiving new data.
            }
        }
        catch {
            
        }
        
    }
    
    
    @IBAction func createAccountButton(_ sender: Any) {
        
        let newUser = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomViewController
        newUser.fullName = textFullName.text!
        newUser.email = textEmailAddress.text!
        newUser.newUser = textNewUsername.text!
        newUser.password = textNewPassword.text!
        self.navigationController?.pushViewController(newUser, animated: true)
        
    }
    
    @IBAction func logInButton(_ sender: Any) {
        // takes the user to the login view controller
        
        let logIn = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as!
        LoginVC
        self.navigationController?.pushViewController(logIn, animated: true)
    }
}
