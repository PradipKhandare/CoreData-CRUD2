//
//  ViewController.swift
//  CoreData2-Save
//
//  Created by NTS on 16/01/24.
//

import UIKit

class ViewController: UIViewController, DataPass {

    @IBOutlet weak var txtName: UITextField!
    var i = Int()
    var isUpdate = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtName.text = object["name"]
        i = index
        isUpdate = isEdit
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let dict = ["name": txtName.text!]
        if isUpdate == true {
            DatabaseHandler.dbh.updateData(object: dict , i: i)
        }else {
            DatabaseHandler.dbh.saveData(obj: dict)
        }
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        let dataVC = storyboard?.instantiateViewController(identifier: "DisplayDataViewController") as? DisplayDataViewController
        dataVC?.delegate = self
        self.navigationController?.pushViewController(dataVC!, animated: true)
    }
}

