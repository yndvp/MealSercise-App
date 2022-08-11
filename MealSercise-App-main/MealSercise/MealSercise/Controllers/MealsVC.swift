//
//  MealsVC.swift
//  MealSercise
//
//  Created by user211625 on 8/3/22.

//  Author: Yunna Jang 200455725
//  Description: This controller is for meal selection page. User can choose the calorie
//  for each meal using slider and it will recommend proper diet matches the calorie. Once
//  the user finish selecting the diets, the data will be passed through to the review page.
//

import UIKit

class MealsVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var breakfastCalLabel: UILabel!
    @IBOutlet weak var lunchCalLabel: UILabel!
    @IBOutlet weak var dinnerCalLabel: UILabel!
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    
    // When the application is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Define username variable
    var username = ""
    
    @IBAction func bSlider(_ sender: UISlider) {
        // Array of calories for breakfast slider
        let calories = [100, 150, 200, 250, 300]
        // Breakfast array matches the calories
        let breakfasts = ["Green Smoothie", "Avocado Toast", "Oatmeal Bowl", "Chicken Tortilla", "Strawberry Waffles"]
       
        // Set the values of slider with calories
        let currentValue = calories[Int(sender.value)]
        // Display selected calorie
        breakfastCalLabel.text = "\(currentValue)"
        // Set the corresponding breakfast menu
        let currentBreakfast = breakfasts[Int(sender.value)]
        // Display the breakfast menu
        breakfastLabel.text = "\(currentBreakfast)"
    }
    
    @IBAction func lSlider(_ sender: UISlider) {
        // Array of calories for lunch slider
        let calories = [100, 150, 200, 250, 300]
        // Lunch array matches the calories
        let lunches = ["Zucchini Parmesan", "Egg Muffins", "Quorn Rice Bowl", "Chicken Fried Rice", "Baked Bean Curry"]
       
        // Set the values of slider with calories
        let currentValue = calories[Int(sender.value)]
        // Display selected calorie
        lunchCalLabel.text = "\(currentValue)"
        // Set the corresponding lunch menu
        let currentLunch = lunches[Int(sender.value)]
        // Display the lunch menu
        lunchLabel.text = "\(currentLunch)"
    }
    
    @IBAction func dSlider(_ sender: UISlider) {
        // Array of calories for dinner slider
        let calories = [100, 150, 200, 250, 300]
        // Dinner array matches the calories
        let dinners = ["Fruit & Yogurt", "Healthy Steak", "Shrimp Rolls", "Tomato Soup", "Vegetables & Lamb"]
       
        // Set the values of slider with calories
        let currentValue = calories[Int(sender.value)]
        // Display selected calorie
        dinnerCalLabel.text = "\(currentValue)"
        // Set the corresponding dinner menu
        let currentDinner = dinners[Int(sender.value)]
        // Display the dinner menu
        dinnerLabel.text = "\(currentDinner)"
    }
    
    // When the user press 'exercise' button
    @IBAction func saveButton(_ sender: UIButton) {
        // Instantiate exercisesVC
        let exercisesVC = self.storyboard?.instantiateViewController(withIdentifier: "TodaysExerciseVC") as! TodaysExercisesViewController
        
        // Save menu of each meal in exercicesVC
        exercisesVC.breakfast = breakfastLabel.text!
        exercisesVC.lunch = lunchLabel.text!
        exercisesVC.dinner = dinnerLabel.text!
        exercisesVC.username = username
        
        // Launch the exercisesVC with saved data
        self.navigationController?.pushViewController(exercisesVC, animated: true)  
    }
    
}
