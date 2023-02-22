//
//  ViewController.swift
//  HeffleBot
//
//  Created by Ben Schwartz on 3/18/22.
//

import UIKit


// https://programmingwithswift.com/parse-json-from-file-and-url-with-swift/
// https://opensheet.elk.sh/19gkmdo2puU_lqOmTfTRHyuCYfpa2mLP9yURZZdunBiY/Sheet1

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let proc = JSON(5);
    
    
    @IBAction func button(_ sender: Any) {
        
        proc.load();
    }
    
}

