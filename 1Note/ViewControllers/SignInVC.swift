//
//  ViewController.swift
//  1Note
//
//  Created by Christopher Lora on 1/30/22.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var logoLarge: UIImageView!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
    }
}

