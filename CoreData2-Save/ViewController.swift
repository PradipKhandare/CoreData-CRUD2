//
//  ViewController.swift
//  CoreData2-Save
//
//  Created by NTS on 16/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let dict = ["name":txtName.text!]
        DatabaseHandler.dbh.saveData(obj: dict)
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        let dataVC = storyboard?.instantiateViewController(identifier: "DisplayDataViewController") as? DisplayDataViewController
        self.navigationController?.pushViewController(dataVC!, animated: true)
    }
}

