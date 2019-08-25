//
//  NavViewController.swift
//  iPawsTemp
//
//  Created by Suraj Roy on 7/24/17.
//  Copyright © 2017 Suraj Roy. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var isMenuOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuPressed(_ sender: Any) {
        
        
        if isMenuOpen == false {
            leadingConstraint.constant = 0
        }
        else {
            leadingConstraint.constant = -150
        }
        
                isMenuOpen = !isMenuOpen
        
    }

}
