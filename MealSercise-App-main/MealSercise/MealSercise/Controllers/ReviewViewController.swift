//
//  ReviewViewController.swift
//  MealSercise
//
//  Created by user211555 on 8/6/22.

/*
 Author: Huidan Kuang 200468027
 Descriptiom: This is a class for the user to review their record. User can see how many diet plans s/he has completed, choose how many records s/he want to review, and the page will show the data
 */

import UIKit

class ReviewViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    //This is the outlet of the table view which will show the datas
    @IBOutlet weak var reviewTable: UITableView!
    
    //This outlet is to show how many diet plans s/he has completed
    @IBOutlet weak var labelPlanNum: UILabel!
    
    //This lable will show the result of the stepper
    @IBOutlet weak var labelMax: UILabel!
    
    //This is the outlet for stepper for user to choose how many records s/he want to review
    @IBOutlet weak var StepperMaxValue: UIStepper!

    //This data struct is to store a single diet plan including meal and exercise
    struct dietPlan {
        let breakfast: String
        let lunch: String
        let dinner: String
        let exercise: String
    }
    
    //This array is to store all of the single diet plans
    var dietData:[dietPlan] = [
        dietPlan(breakfast: "Green Smoothie", lunch: "Zucchini Parmesan", dinner: "Fruit & Yogurt", exercise: "Hiking"),
        dietPlan(breakfast: "Chicken Tortilla", lunch: "Baked Bean Curry", dinner: "Tomato Soup", exercise: "High-Knee running"),
    ]
    
    override func viewDidLoad() {
        //labelPlanNum label will calculate how many elements are in the dietData array and show it to the user
        labelPlanNum.text=String(dietData.count)
        
        //labelMac label default to 0
        labelMax.text="0"
        
        super.viewDidLoad()
        reviewTable.dataSource = self
        reviewTable.delegate = self
        
        //Set the minimum value of the stepper to 0
        StepperMaxValue.minimumValue = 0
        
        //Set the maximum value of the stepper to the size of the diet datas array
        StepperMaxValue.maximumValue = Double(dietData.count)
        

    }
    
    /*
     When the stepper changed for the user to choose the maximum reviews they want ro see, the text in the label will show user the number, and the review table will reload
     */
    @IBAction func stepperMax(_ sender: UIStepper) {
        
        labelMax.text=sender.value.description
        
        reviewTable.reloadData()
    }
    
    /*
     This function is to return the number of rows in the table
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //The number of rows of the table is set to how many reviews the user want to see
        return Int(StepperMaxValue.value)  }
    
    /*
     This function is to define what will show in a single cell of the table view
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Loop into the dietData array and store the single datas in dietPlan
        let dietPlan = dietData[indexPath.row]
        
        //This is a property for ReviewTableViewCell
        let reviewCell = reviewTable.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! ReviewTableViewCell
        
        //Datas in dietData array will show in each label of the review cell
        reviewCell.labelBreakfast.text = dietPlan.breakfast
        reviewCell.labelLunch.text = dietPlan.lunch
        reviewCell.labelDinner.text = dietPlan.dinner
        reviewCell.labelEx.text = dietPlan.exercise
        return reviewCell
    }
    
    /*
     This function is to return the height of the table view
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 127
    }
    
    


}
