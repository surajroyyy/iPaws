//
//  ViewController.swift
//  iPawsTemp
//
//  Created by Suraj Roy on 7/20/17.
//  Copyright © 2017 Suraj Roy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailT: UITextField!
    
    @IBOutlet weak var passT: UITextField!
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var passV: UITextField!
    
    @IBOutlet weak var loginOutlet: UIButton!
    
    @IBOutlet weak var errorT: UILabel!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var login: Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginOutlet.layer.cornerRadius = 10
        loginOutlet.layer.borderWidth = 1
        
        
        
        loading.isHidden = true
        errorT.text = ""
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        passV.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        
        login = !login
        
        if login {
            passV.isHidden = true
            errorT.text = ""
            emailT.text = ""
            passT.text = ""
            loginOutlet.setTitle("Sign In", for: .normal)
            
        }
        else {
            passV.isHidden = false
            errorT.text = ""
            emailT.text = ""
            passT.text = ""
            passV.text = ""
            loginOutlet.setTitle("Register", for: .normal)
        }
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if let email = emailT.text, let pass = passT.text, let pass2 = passV.text {
            if login {
                
                errorT.text = ""
                //login user
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    // ...
                    
                    if let u = user {
                        //                        self.loading.isHidden = false
                        //                        self.loading.startAnimating()
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                        //                        self.loading.isHidden = true
                        self.emailT.text = ""
                        self.passT.text = ""
                    }
                    else {
                        //report error
                        self.errorT.text = "Either your credentials were incorrect or you need an account."
                        self.emailT.text = ""
                        self.passT.text = ""
                    }
                    
                }
            }
            else {
                //register user
                errorT.text = ""
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    // ...
                    
                    if  let u = user{
                        
                        self.performSegue(withIdentifier:
                            "goToHome", sender: self)
                        self.emailT.text = ""
                        self.passT.text = ""
                        self.passV.text = ""
                    
                    }
                    else if pass != pass2 {
                        self.errorT.text = "Passwords do not match"
                        self.emailT.text = ""
                        self.passT.text = ""
                        self.passV.text = ""

                    }
                    else {
                        self.errorT.text = "Invalid email/password."
                        self.emailT.text = ""
                        self.passT.text = ""
                        self.passV.text = ""
                    }
                    
                }
            }
            
        }
        
        
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
    }
    
}

