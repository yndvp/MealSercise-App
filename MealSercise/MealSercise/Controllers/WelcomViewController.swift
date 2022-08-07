//
//  WelcomViewController.swift
//  MealSercise
//
//  Created by user211625 on 7/29/22.
//

import UIKit

class WelcomViewController: UIViewController {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
            
    @IBOutlet weak var newUserTextView: UITextView!
    
    
    
    var userName = ""
    var newUser = ""
    var fullName = ""
    var email = ""
    var password = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userName
        newUserTextView.text = " User Name: \(newUser)\n Full Name: \(fullName)\n Email: \(email)\n Password: \(password)"
//        newUserTextView.text = fullName
//        newUserTextView.text = email
//        newUserTextView.text = password
       
    }
    
    
    @IBOutlet weak var exercises: UITabBar!
    
    
    @IBAction func exercisesButton(_ sender: UIButton) {

        let exercisesVC = self.storyboard?.instantiateViewController(withIdentifier: "TodaysExerciseVC") as! TodaysExercisesViewController
        self.navigationController?.pushViewController(exercisesVC, animated: true)
    }
    
    @IBAction func mealsButton(_ sender: UIButton) {
        
        let mealsVC = self.storyboard?.instantiateViewController(withIdentifier: "meals") as! MealsVC
        self.navigationController?.pushViewController(mealsVC, animated: true)
    }
    
    
    @IBAction func btnReview(_ sender: UIButton) {
        let reviewVC = self.storyboard?.instantiateViewController(withIdentifier: "ReviewViewController")
    }
    
}
