//
//  UserDefaults.swift
//  MealSercise
//
//  Created by user211625 on 8/5/22.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultsKeys: String {
        case signedIn
    }
    
    var signedIn: User? {
        
        get {
            if let data = object(forKey: UserDefaultsKeys.signedIn.rawValue) as? Data {
                let user = try? JSONDecoder().decode(User.self, from: data)
                return user
            }
            return nil
        }
        
        set {
            if newValue == nil {
                removeObject(forKey: UserDefaultsKeys.signedIn.rawValue)
            }else{
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDefaultsKeys.signedIn.rawValue)
            }
        }
    }
}
