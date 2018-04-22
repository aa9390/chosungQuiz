//
//  LevelViewController.swift
//  ChosungQuiz
//
//  Created by SWUCOMPUTER on 2018. 4. 21..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    @IBOutlet var categoryTitle: UILabel!
    @IBOutlet var levelTitle: UILabel!
    @IBOutlet var levelSegment: UISegmentedControl!
    @IBOutlet var okButton: UIButton!
    
    var userName: String!
    var categoryName: String!
    var levelName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelName = "Easy"
        categoryTitle.text = categoryName
        levelTitle.text = levelName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func categorySelect(_ sender: UISegmentedControl) {
        levelName = sender.titleForSegment(at: sender.selectedSegmentIndex)
    }
    
    @IBAction func okButtonClick(_ sender: Any) {
        levelTitle.text! = levelName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameView" {
            let destVC = segue.destination as! GameViewController
            userName = self.userName!
            categoryName = self.categoryName!
            levelName = self.levelName!
            
            destVC.title = "퀴즈"
            destVC.userName = userName
            destVC.categoryName = categoryName
            destVC.levelName = levelName
        }
    }
    
}
