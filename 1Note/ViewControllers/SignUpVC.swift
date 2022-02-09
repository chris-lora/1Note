//
//  SignUpVCViewController.swift
//  1Note
//
//  Created by Christopher Lora on 2/7/22.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var logoLarge: UIImageView!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != "" && emailText.text != "" {
                    
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictionary = ["email" : self.emailText.text!,"username": self.usernameText.text!] as [String : Any]
                    
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                        if error != nil {
                            //
                        }
                    }
                    self.performSegue(withIdentifier: "toAdminHomeVC", sender: nil)
                }
            }
            
        } else {
            self.makeAlert(title: "Error", message: "Username/Password/Email ?")
        }
        
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }
    
    @objc override func makeAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }

}
