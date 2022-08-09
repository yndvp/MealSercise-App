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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calorieSlide(_ sender: UISlider) {
        
        let calo = [340, 400, 450, 500, 560, 650]
        let exer = ["Hiking", "Jogging", "Jump rope", "Bicycling", "Water polo", "Running"]
        let exer2 = ["High-Knee running", "Swimming", "Stationary Bicycle", "Calisthenics", "Sprints", "Kick boxing"]
        let exer3 = ["Butt kicks", "Aerobic dance", "Rowning Machine", "Circuit Training", "Spinning", "Kettlebell Circuits"]
        
       
        let currentValue = calo[Int(sender.value)]
        calCountLabel.text = "\(currentValue)"
        let currentExer = exer[Int(sender.value)]
        exerciseOneLabel.text = "\(currentExer)"
        let currentExer2 = exer2[Int(sender.value)]
        exerciseTwoLabel.text = "\(currentExer2)"
        let currentExer3 = exer3[Int(sender.value)]
        exerciseThreeLabel.text = "\(currentExer3)"
        

            }
      
    @IBAction func exitButton(_ sender: UIButton) {
    }
}
