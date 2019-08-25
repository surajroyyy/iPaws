//
//  Home.swift
//  iPawsTemp
//
//  Created by Suraj Roy on 7/24/17.
//  Copyright © 2017 Suraj Roy. All rights reserved.
//

import UIKit
import MapKit


class Home: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var leading: NSLayoutConstraint!
    

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet var screenView: UIView!
    
    var isMenu: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapType = MKMapType.hybrid
        
//        var longitude = mapView.userLocation.coordinate.longitude
//        var latitude = mapView.userLocation.coordinate.latitude
        
        
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "three lines.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(Home.menuPressed), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        
        performSegue(withIdentifier: "unwind", sender: self)
        
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        
        
        if isMenu == false{
            leading.constant = 0
        }
        else{
            leading.constant = -100
        }
        
        
        isMenu = !isMenu
        
    }
    

}
