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
    
    
    //MARK: - Save Data into the CoreData
    func saveData(obj: [String: String]) {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!) as? Employee
        employee!.name = obj["name"]
        
        do{
            try? context?.save()
        }catch {
            print("Data successfully not saved!!")
        }
    }
    
    //MARK: - GetData From CoreData
    func getData() -> [Employee]?{
       var EmpData = [Employee]()
       let request = NSFetchRequest<NSManagedObject>(entityName: "Employee")
        do{
            EmpData = try (context?.fetch(request) as? [Employee])!
            return EmpData
        }catch {
            print("Data can not found.")
            return nil
        }
        
    }
    
    //MARK: - Delete data from coreData.
    func deleteData(index: Int) -> [Employee]?{
        var employeeData = getData()
        context?.delete(employeeData![index])
        employeeData?.remove(at: index)
        do{
            try context?.save()
            return employeeData
        }catch {
            print("Data has not deleted. Please try again.")
            return nil
        }
    }
}
