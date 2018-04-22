//
//  CategoryViewController.swift
//  ChosungQuiz
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var categoryPicker: UIPickerView!
    @IBOutlet var categoryTitle: UILabel!
    @IBOutlet var levelTitle: UILabel!
    @IBOutlet var okButton: UIButton!
    
    var userName: String!
    var categoryName: String!
    let categoryArray: [String] = ["영화", "음식", "사자성어"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return categoryArray[row]
    }
    
    @IBAction func okButtonClick(_ sender: Any) {
        categoryName = categoryArray[self.categoryPicker.selectedRow(inComponent: 0)]
        categoryTitle.text = categoryName
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLevelView" {
            let destVC = segue.destination as! LevelViewController
            userName = self.userName!
            categoryName = self.categoryName!
            
            destVC.title = "난이도"
            destVC.userName = userName
            destVC.categoryName = categoryName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryName = categoryArray[0]
        categoryTitle.text = categoryName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
