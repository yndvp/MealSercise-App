//
//  ViewController.swift
//  MealSercise
//
//  Created by user211625 on 7/23/22.
//

import UIKit
import Auth0
import JWTDecode

class ViewController: UIViewController {
        

    private var appJustLaunched = true
    private var userIsAuthenticated = false
    
    //private var user = User.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


//extension ViewController {
//
//    override func viewDidLoad() {
//      super.viewDidLoad()
//
////        updateTitle()
////         userInfoStack.isHidden = true
////         loginButton.isEnabled = true
////         logoutButton.isEnabled = false
//    }
//
    @IBAction func logInButton(_ sender: UIButton) {

//        if !userIsAuthenticated {
//              login()
//            }
//         takes the user to the login VC

                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
//
    @IBAction func newAccountButton(_ sender: UIButton) {
        // takes the user to the new account VC

        let newAccountVC = self.storyboard?.instantiateViewController(withIdentifier: "NewAccountVC") as! NewAccountVC
        self.navigationController?.pushViewController(newAccountVC, animated: true)
    }
}

//
//
//    @IBAction func logOut(_ sender: Any) {
//
//        if userIsAuthenticated {
//            logout()
//        }
//    }
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

