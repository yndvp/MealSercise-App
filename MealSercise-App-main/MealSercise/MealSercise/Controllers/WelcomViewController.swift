//
//  WelcomViewController.swift
//  MealSercise
//
//  Created by user211625 on 7/29/22.
//

import UIKit

class WelcomViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    
    // Define variables
    var userName = ""
    var breakfast = ""
    var lunch = ""
    var dinner = ""
    var exercise = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the labels with corresponding data
        userNameLabel.text = userName
        breakfastLabel.text = breakfast
        lunchLabel.text = lunch
        dinnerLabel.text = dinner
        exerciseLabel.text = exercise
    }
    
    @IBAction func btnBeginWithMeal(_ sender: UIButton) {
        let mealsVC = self.storyboard?.instantiateViewController(withIdentifier: "meals") as! MealsVC
        self.navigationController?.pushViewController(mealsVC, animated: true)
    }
    
    
    /*
     Author: Huidan Kuang 200468027
     Description: This is a function of the Review button for the user to click and go to the Review page whose story board ID is "ReviewViewController"
     */
    @IBAction func btnReview(_ sender: UIButton) {
        //This is to instantiate a ViewController property
        let reviewVC = self.storyboard?.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
        
        //This is to store the local variable in the struct which I created in the review page
        let newData = ReviewViewController.dietPlan(breakfast: breakfast, lunch: lunch, dinner: dinner, exercise: exercise)
        
        //Append the dietData array with the newData
        reviewVC.dietData.append(newData)
        
        //Push to reviewVC
        self.navigationController?.pushViewController(reviewVC, animated: true)
    }
    
}
