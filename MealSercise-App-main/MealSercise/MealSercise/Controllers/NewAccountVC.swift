//
//  NewAccountVC.swift
//  MealSercise
//
//  Created by user211625 on 7/23/22.
// Author: Marcin Orgacki
// This view controller adds a new user to Core Data and UserDefaults. It lets the user create new account.
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
    
    // Data for the table if exists
    var userInfo:[NewUser]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Using UserDefaults to store new user. Assigning value to a key that will be stored in
        // UserDefaults
        let email = UserDefaults.standard.string(forKey: "email")
        let fullName = UserDefaults.standard.string(forKey: "fullName")
        let password = UserDefaults.standard.string(forKey: "password")
        let userName = UserDefaults.standard.string(forKey: "userName")
        
        // Assigning values from text fields to keys.
        if email != nil , password != nil {
            textEmailAddress.text = email
            textNewPassword.text = password
        }
        
        //print("Email: \(email!), Password: \(password!)")
        
        //CoreData
        //tableView.dataSource = self
        //tableView.delegate = self
        //CoreData
        //fetchInfo()
        
    }
    
//    // Will retrieve info from Core Data to display in tableview(CoreData)
//    func fetchInfo() {
//
//        do{
//            self.userInfo = try context.fetch(NewUser.fetchRequest())
//            // makes the main thread handle the update and reload of the UI to save resources.
//            DispatchQueue.main.async {
//                self.tableView.reloadData()// reloads the tableview upon receiving new data.
//            }
//        }
//        catch {
//
//        }
//
//    }
    
    
    @IBAction func createAccountButton(_ sender: Any) {
        // This function has two duties.
        // One, it saves the user's info to the Login session in UserDefaults
        // Two, it saves the user's info to Core Data
        
        // Assigning user input to UserDefaults keys
        UserDefaults.standard.set(textFullName.text, forKey: "fullName")
        UserDefaults.standard.set(textEmailAddress.text, forKey: "email")
        UserDefaults.standard.set(textNewPassword.text, forKey: "password")
        UserDefaults.standard.set(textNewUsername.text, forKey: "userName")
       
        
        // Creates a new_user object(CoreData)
        let new_user = NewUser(context: self.context)
        new_user.fullName = textFullName.text
        new_user.userName = textNewUsername.text
        new_user.password = textNewPassword.text
        new_user.email = textEmailAddress.text
        
        // Save the new_user object to Core Data
        do{
            try self.context.save()
        }
        catch {
            print("unable to save data")
        }
                
        let newUser = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as!
        LoginVC
        self.navigationController?.pushViewController(newUser, animated: true)
        
    }
    
    @IBAction func logInButton(_ sender: Any) {
        // takes the user to the login view controller
        
        let logIn = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as!
        LoginVC
        self.navigationController?.pushViewController(logIn, animated: true)
    }
}
