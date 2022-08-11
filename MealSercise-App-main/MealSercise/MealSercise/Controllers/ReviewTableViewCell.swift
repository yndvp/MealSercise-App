//
//  ReviewTableViewCell.swift
//  MealSercise
//
//  Created by user211555 on 8/7/22.

/*
 Author: Huidan Kuang 200468027
 Descriptiom: This is a class to store the contents for each cell of the tableView
 */

import UIKit

class ReviewTableViewCell: UITableViewCell {

    //This is a label to show the breakfast
    @IBOutlet weak var labelBreakfast: UILabel!

    //This is a label to show the lunch
    @IBOutlet weak var labelLunch: UILabel!
    
    //This is a label to show the dinner
    @IBOutlet weak var labelDinner: UILabel!
    
    //This is a label to show the exercise
    @IBOutlet weak var labelEx: UILabel!
}
