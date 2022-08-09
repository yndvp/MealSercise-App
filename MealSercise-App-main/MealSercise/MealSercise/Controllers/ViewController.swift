//
//  ViewController.swift
//  MealSercise
//
//  Created by user211625 on 7/23/22.

//  Author: Marcin Orgacki SN: 200467950
//  This is the landing page of the application. It lets the user click a button to either Login or Register.
//  After the user clicks a button they will be redirected to either LoginVC or NewAccountVC
//  It also features an extension to the ViewController in which we have two functions, save and retrieveValues.
//  Those functions work on Core Data to save and retrieve user information.

import UIKit
import CoreData
import Auth0
import JWTDecode

class ViewController: UIViewController {
        

//    private var appJustLaunched = true
//    private var userIsAuthenticated = false
    
    //private var user = User.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.retrieveValues()
        
        // Do any additional setup after loading the view.
    }



    @IBAction func logInButton(_ sender: UIButton) {

//        if !userIsAuthenticated {
//              login()
//            }
        
//         takes the user to the loginVC. this code is here to instantiate the destination controller and to
//         push us onto the destination controller

                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
//
    @IBAction func newAccountButton(_ sender: UIButton) {
        // takes the user to the new account VC
//          this code is here to instantiate the destination controller and to
        //  push us onto the destination controller
        let newAccountVC = self.storyboard?.instantiateViewController(withIdentifier: "NewAccountVC") as! NewAccountVC
        self.navigationController?.pushViewController(newAccountVC, animated: true)
    }
    
    @IBAction func logOut(_ sender: Any) {

       
        
        //if userIsAuthenticated {
         //   logout()
        }
    
}

// MARK: - Extension

extension ViewController {
    
    func save(value: String) {
        // saves user input to Core Data. assigns persistant container view context to context which holds our entity
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            
            guard let entityDescription = NSEntityDescription.entity(forEntityName: "NewUser", in: context)
            else {return}
            // defines a new object entry and assigns to variable newEntry
            let newEntry = NSManagedObject(entity: entityDescription, insertInto: context)
            // setting the value of newEntry to the specific key in our entity
            newEntry.setValue(value, forKey: "email")
            
            newEntry.setValue(value, forKey: "password")
            
            newEntry.setValue(value, forKey: "fullName")
            
            newEntry.setValue(value, forKey: "userName")
            
            do {
                try context.save()
                //print("Saved: \(value)")
            }catch {
                print("Saving Error")
            }
            
        }
    }
    
    func retrieveValues() {
        // assigns persistant container view context to context which holds our entity
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            // request to fetch all info from our entity
            let fetchRequest = NSFetchRequest<NewUser>(entityName: "NewUser")
            //fetchRequest.fetchLimit = 5
                       
            
            do {// assigns fetch equest to variuble result
                let results = try context.fetch(fetchRequest)
                // itirates throught results and prints to console
                for result in results {
                    
                    if let value = result.fullName {
                        print("\nFull name: \(value)")
                    }
                    
                    if let value = result.userName {
                        print("Username: \(value)")
                    }
                    if let value = result.email {
                        print("Email: \(value)")
                    }
                    
                    if let value = result.password {
                        print("Password: \(value)")
                    }
                }
            } catch {
                print("Failed to retrieve")
            }
        }
    }
}



    
//
//    // MARK: UI updaters
//    // =================
//
////    func updateTitle() {
////      // New code
////      if appJustLaunched {
////        titleLabel.text = "Welcome to the app!"
////        appJustLaunched = false
////      } else {
////        if userIsAuthenticated {
////          titleLabel.text = "You’re logged in."
////        } else {
////          titleLabel.text = "You’re logged out."
////        }
////      }
////      // New code 👆🏽
////
////    }
////
////    func updateButtonsAndStack() {
////        loginButton.isEnabled = !userIsAuthenticated
////        logoutButton.isEnabled = userIsAuthenticated
////        userInfoStack.isHidden = !userIsAuthenticated
////    }
////
////    func updateUserInfoUI() {
////        userNameLabel.text = user.name
////        userEmailLabel.text = user.email
////        userPicture.load(url: URL(string: user.picture)!)
////    }
//
//
//    // MARK: Login, logout, and user information
//    // =========================================
//
//    func login() {
//        Auth0
//           .webAuth()
//           .start { result in
//
//             switch result {
//
//               case .failure(let error):
//
//                 if error == .userCancelled {
//                             let alert = UIAlertController(
//                               title: "Please log in.",
//                               message: "You need to log in to use the app.",
//                               preferredStyle: .alert)
//                             alert.addAction(
//                               UIAlertAction(
//                                 title: NSLocalizedString(
//                                   "OK",
//                                   comment: "Default action"
//                                 ),
//                                 style: .default,
//                                 handler: { _ in
//                                   NSLog("Displayed the \"Please log in\" alert.")
//                             }))
//                             self.present(alert, animated: true, completion: nil)
//
//                           } else {
//                             print("An unexpected error occurred: \(error.localizedDescription)")
//                           }
//
//               case .success(let credentials):
//                 // The user successfully logged in.
//                 self.userIsAuthenticated = true
//                    self.user = User.from(credentials.idToken)
//
////                    DispatchQueue.main.async {
////                        self.updateTitle()
////                        self.updateButtonsAndStack()
////                        self.updateUserInfoUI()
////                    }
//
//             } // switch
//
//           } // start()
//    }
//
//    func logout() {
//      // New code 👇🏽
//      Auth0
//        .webAuth()
//        .clearSession { result in
//          switch result {
//
//            case .failure(let error):
//              print("Failed with: \(error)")
//
//            case .success():
//              self.userIsAuthenticated = false
//              self.user = User.empty
//
////              DispatchQueue.main.async {
////                self.updateTitle()
////                self.updateButtonsAndStack()
////              }
//
//          } // switch
//
//      } // clearSession()
//
//  }
//
//
//  // MARK: Utilities
//  // ===============
//
//  func plistValues(bundle: Bundle) -> (clientId: String, domain: String)? {
//    guard
//      let path = bundle.path(forResource: "Auth0", ofType: "plist"),
//      let values = NSDictionary(contentsOfFile: path) as? [String: Any]
//      else {
//        print("Missing Auth0.plist file with 'ClientId' and 'Domain' entries in main bundle!")
//        return nil
//      }
//
//    guard
//      let clientId = values["ClientId"] as? String,
//      let domain = values["Domain"] as? String
//      else {
//        print("Auth0.plist file at \(path) is missing 'ClientId' and/or 'Domain' entries!")
//        print("File currently has the following entries: \(values)")
//        return nil
//      }
//
//    return (clientId: clientId, domain: domain)
//  }
//}

