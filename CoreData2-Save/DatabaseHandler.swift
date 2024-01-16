//
//  DatabaseHandler.swift
//  CoreData2-Save
//
//  Created by NTS on 16/01/24.
//

import Foundation
import UIKit
import CoreData

class DatabaseHandler
{
    static var dbh = DatabaseHandler()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveData(obj: [String: String]) {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!) as? Employee
        employee!.name = obj["name"]
        
        do{
            try? context?.save()
        }catch {
            print("Data successfully not saved!!")
        }
    }
}
