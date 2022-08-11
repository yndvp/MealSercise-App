//
//  TodaysExercisesViewController.swift
//  MealSercise
//
//  Created by user211625 on 7/29/22.
//  Author: Marcin Orgacki
//  Description: This view controller lets the user select calorie she(he) wants to burn and recommend exercises based on it. User can choose one of the exercises from the recommendation lists
//

import UIKit

class TodaysExercisesViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var calCountLabel: UILabel!
    @IBOutlet weak var exerciseOneLabel: UILabel!
    @IBOutlet weak var exerciseTwoLabel: UILabel!
    @IBOutlet weak var exerciseThreeLabel: UILabel!
    @IBOutlet weak var e1Label: UILabel!
    @IBOutlet weak var e2Label: UILabel!
    @IBOutlet weak var e3Label: UILabel!
    
    
    // Define variables for passed data
    var breakfast = ""
    var lunch = ""
    var dinner = ""
    var username = ""
    
    // Define a variable for exercise selected
    var exercise = ""
    
    // When exercise page is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Author: Marcin Orgacki
    @IBAction func calorieSlide(_ sender: UISlider) {
        // arrays for the slider
        let calo = [340, 400, 450, 500, 560, 650]
        // exercises arrays
        let exer = ["Hiking", "Jogging", "Jump rope", "Bicycling", "Water polo", "Running"]
        let exer2 = ["High-Knee running", "Swimming", "Stationary Bicycle", "Calisthenics", "Sprints", "Kick boxing"]
        let exer3 = ["Butt kicks", "Aerobic dance", "Rowning Machine", "Circuit Training", "Spinning", "Kettlebell Circuits"]
        
       // assigns the value of the slider to labels. 
        let currentValue = calo[Int(sender.value)]
        calCountLabel.text = "\(currentValue)"
        let currentExer = exer[Int(sender.value)]
        exerciseOneLabel.text = "\(currentExer)"
        let currentExer2 = exer2[Int(sender.value)]
        exerciseTwoLabel.text = "\(currentExer2)"
        let currentExer3 = exer3[Int(sender.value)]
        exerciseThreeLabel.text = "\(currentExer3)"
        

    }
    
    /*
     Author: Yunna Jang 200455725
     Description: When the user select 'exercise 1' button, spotlight exercise 1 with white color and save the selected exercise in exercise variable
     */
    @IBAction func e1(_ sender: UIButton) {
        e2Label.backgroundColor = UIColor.systemGreen
        e3Label.backgroundColor = UIColor.systemGreen
        e1Label.backgroundColor = UIColor.white
        exercise = exerciseOneLabel.text!
    }
    
    /*
     Author: Yunna Jang 200455725
     Description: When the user select 'exercise 2' button, spotlight exercise 2 with white color and save the selected exercise in exercise variable
     */
    @IBAction func e2(_ sender: UIButton) {
        e1Label.backgroundColor = UIColor.systemGreen
        e3Label.backgroundColor = UIColor.systemGreen
        e2Label.backgroundColor = UIColor.white
        exercise = exerciseTwoLabel.text!
    }
    
    /*
     Author: Yunna Jang 200455725
     Description: When the user select 'exercise 3' button, spotlight exercise 3 with white color and save the selected exercise in exercise variable
     */
    @IBAction func e3(_ sender: UIButton) {
        e1Label.backgroundColor = UIColor.systemGreen
        e2Label.backgroundColor = UIColor.systemGreen
        e3Label.backgroundColor = UIColor.white
        exercise = exerciseThreeLabel.text!
    }
    
    /*
     Author: Yunna Jang 200455725
     Description: Instantiate backToView controller and initialize it with all the data that made of user selections, and pass those to the welcome page
     */
    @IBAction func exitButton(_ sender: UIButton) {
        // Instantiate backToView controller
        let backToView = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomViewController
        
        // Save exercise, meals, username info in backToView
        backToView.exercise = exercise
        backToView.breakfast=breakfast
        backToView.lunch=lunch
        backToView.dinner=dinner
        backToView.userName = username
        
        // Push to welcome page
        self.navigationController?.pushViewController(backToView, animated: true)
    }
}
