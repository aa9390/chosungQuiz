//
//  NameViewController.swift
//  ChosungQuiz
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCategoryView" {
            let destVC = segue.destination as! CategoryViewController
            let userName: String! = nameTextField.text!
            
            destVC.title = "카테고리"
            destVC.userName = userName
        } }

}
