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
    
    @IBAction func exercisesButton(_ sender: UIButton) {

        let exercisesVC = self.storyboard?.instantiateViewController(withIdentifier: "TodaysExerciseVC") as! TodaysExercisesViewController
        self.navigationController?.pushViewController(exercisesVC, animated: true)
    }
    
    @IBAction func mealsButton(_ sender: UIButton) {
        
        let mealsVC = self.storyboard?.instantiateViewController(withIdentifier: "meals") as! MealsVC
        self.navigationController?.pushViewController(mealsVC, animated: true)
    }
    
    
    @IBAction func btnReview(_ sender: UIButton) {
        let reviewVC = self.storyboard?.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
        self.navigationController?.pushViewController(reviewVC, animated: true)
    }
    
}
