//
//  MealsVC.swift
//  MealSercise
//
//  Created by user211625 on 8/3/22.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func bSlider(_ sender: UISlider) {
        // Slider value array
        let calories = [100, 150, 200, 250, 300]
        // Breakfast array
        let breakfasts = ["Green Smoothie", "Avocado Toast", "Oatmeal Bowl", "Chicken Tortilla", "Strawberry Waffles"]
       
        // Set the corresponding calorie
        let currentValue = calories[Int(sender.value)]
        breakfastCalLabel.text = "\(currentValue)"
        // Set the corresponding breakfast menu
        let currentBreakfast = breakfasts[Int(sender.value)]
        breakfastLabel.text = "\(currentBreakfast)"
    }
    
    @IBAction func lSlider(_ sender: UISlider) {
        // Slider value array
        let calories = [100, 150, 200, 250, 300]
        // Breakfast array
        let lunches = ["Zucchini Parmesan", "Egg Muffins", "Quorn Rice Bowl", "Chicken Fried Rice", "Baked Bean Curry"]
       
        // Set the corresponding calorie
        let currentValue = calories[Int(sender.value)]
        lunchCalLabel.text = "\(currentValue)"
        // Set the corresponding breakfast menu
        let currentLunch = lunches[Int(sender.value)]
        lunchLabel.text = "\(currentLunch)"
    }
    
    @IBAction func dSlider(_ sender: UISlider) {
        // Slider value array
        let calories = [100, 150, 200, 250, 300]
        // Breakfast array
        let dinners = ["Fruit & Yogurt", "Healthy Steak", "Shrimp Rolls", "Tomato Soup", "Vegetables & Lamb"]
       
        // Set the corresponding calorie
        let currentValue = calories[Int(sender.value)]
        dinnerCalLabel.text = "\(currentValue)"
        // Set the corresponding breakfast menu
        let currentDinner = dinners[Int(sender.value)]
        dinnerLabel.text = "\(currentDinner)"
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        let backToMain = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomViewController
        self.navigationController?.pushViewController(backToMain, animated: true)
    }
    
}
