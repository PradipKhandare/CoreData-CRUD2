//
//  DisplayDataViewController.swift
//  CoreData2-Save
//
//  Created by NTS on 17/01/24.
//

import UIKit

class DisplayDataViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    var employeeData = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeData = DatabaseHandler.dbh.getData()!
    }

}

extension DisplayDataViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.labelName.text = employeeData[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            employeeData = DatabaseHandler.dbh.deleteData(index: indexPath.row)!
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
