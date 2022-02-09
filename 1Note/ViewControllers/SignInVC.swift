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
        
        if passwordText.text != "" && emailText.text != "" {
                    
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (result, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toAdminHomeVC", sender: nil)
                }
            }

        } else {
            self.makeAlert(title: "Error", message: "Password/Email ?")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {

        self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
        
    }
    
    @objc override func makeAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

