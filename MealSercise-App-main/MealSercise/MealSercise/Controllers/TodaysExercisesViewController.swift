//
//  TodaysExercisesViewController.swift
//  MealSercise
//
//  Created by user211625 on 7/29/22.
//

import UIKit

class TodaysExercisesViewController: UIViewController {
    
      
    
    @IBOutlet weak var calCountLabel: UILabel!
    
    @IBOutlet weak var exerciseOneLabel: UILabel!
    
    @IBOutlet weak var exerciseTwoLabel: UILabel!
    
    @IBOutlet weak var exerciseThreeLabel: UILabel!
    
    @IBOutlet weak var e1Label: UILabel!
    @IBOutlet weak var e2Label: UILabel!
    @IBOutlet weak var e3Label: UILabel!
    
    var exercise = ""
    
    // Define variables
    var breakfast = ""
    var lunch = ""
    var dinner = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calorieSlide(_ sender: UISlider) {
        // Marcin Orgacki
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
    
    @IBAction func e1(_ sender: UIButton) {
        e2Label.backgroundColor = UIColor.systemGreen
        e3Label.backgroundColor = UIColor.systemGreen
        e1Label.backgroundColor = UIColor.white
        exercise = exerciseOneLabel.text!
    }
    
    
    @IBAction func e2(_ sender: UIButton) {
        e1Label.backgroundColor = UIColor.systemGreen
        e3Label.backgroundColor = UIColor.systemGreen
        e2Label.backgroundColor = UIColor.white
        exercise = exerciseTwoLabel.text!
    }
    
    
    @IBAction func e3(_ sender: UIButton) {
        e1Label.backgroundColor = UIColor.systemGreen
        e2Label.backgroundColor = UIColor.systemGreen
        e3Label.backgroundColor = UIColor.white
        exercise = exerciseThreeLabel.text!
    }
    
    @IBAction func exitButton(_ sender: UIButton) {
        
        let backToView = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomViewController
        backToView.exercise = exercise
        backToView.breakfast=breakfast
        backToView.lunch=lunch
        backToView.dinner=dinner
        
        self.navigationController?.pushViewController(backToView, animated: true)
    }
}
