//
//  ReviewViewController.swift
//  MealSercise
//
//  Created by user211555 on 8/6/22.
//

import UIKit

class ReviewViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var reviewTable: UITableView!
    
    @IBOutlet weak var labelPlanNum: UILabel!
    
    
    @IBOutlet weak var labelMax: UILabel!
    
    
    @IBOutlet weak var StepperMaxValue: UIStepper!

    struct dietPlan {
        let breakfast: String
        let lunch: String
        let dinner: String
        let exercise: String
    }
    
    var dietData:[dietPlan] = [
        dietPlan(breakfast: "vege", lunch: "vege", dinner: "vege", exercise: "running"),
        dietPlan(breakfast: "sala", lunch: "vege", dinner: "vege", exercise: "running"),
    ]
    
    override func viewDidLoad() {
        labelPlanNum.text=String(dietData.count)
        
        labelMax.text="0"
        
        super.viewDidLoad()
        reviewTable.dataSource = self
        reviewTable.delegate = self
        
        StepperMaxValue.minimumValue = 0
        StepperMaxValue.maximumValue = Double(dietData.count)
        

    }
    
    
    @IBAction func stepperMax(_ sender: UIStepper) {
        
        labelMax.text=sender.value.description
        
        reviewTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(StepperMaxValue.value)  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dietPlan = dietData[indexPath.row]
        let reviewCell = reviewTable.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! ReviewTableViewCell
        reviewCell.labelBreakfast.text = dietPlan.breakfast
        reviewCell.labelLunch.text = dietPlan.lunch
        reviewCell.labelDinner.text = dietPlan.dinner
        reviewCell.labelEx.text = dietPlan.exercise
        return reviewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 127
    }
    
    


}
