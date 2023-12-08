//
//  ForgotViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 14/11/23.
//

import UIKit
import FirebaseAuth
import Firebase

class ForgotViewController: UIViewController {

    @IBOutlet var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func forgotbtn(_ sender: Any) {
        if email.text?.isEmpty == true {
            print("Please enter email")
            return
        }
        Auth.auth().sendPasswordReset(withEmail: email.text!){ (error) in
            if(error == nil){
                print("Sent!!!")
            }
            else{
                print("Failed - \(String(describing: error?.localizedDescription))")
            }
        }
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "login")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    
}
