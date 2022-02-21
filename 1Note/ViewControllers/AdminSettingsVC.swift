//
//  SettingsVC.swift
//  1Note
//
//  Created by Christopher Lora on 2/6/22.
//

import UIKit
import Firebase

class AdminSettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        } catch {
            
        }
    }
}
