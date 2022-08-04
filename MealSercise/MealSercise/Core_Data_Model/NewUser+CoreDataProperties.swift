//
//  NewUser+CoreDataProperties.swift
//  MealSercise
//
//  Created by user211625 on 8/3/22.
//
//

import Foundation
import CoreData


extension NewUser {
        // A methdo to fetch all contents of NewUser
    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewUser> {
        return NSFetchRequest<NewUser>(entityName: "NewUser")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var userName: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?

}

extension NewUser : Identifiable {

}
