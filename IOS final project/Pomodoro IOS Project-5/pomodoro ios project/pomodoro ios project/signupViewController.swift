//
//  signupViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 12/11/23.
//

import UIKit
import FirebaseAuth
import Firebase
class signupViewController: UIViewController {

    @IBOutlet var repass: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func signupTapped(_ sender: Any) {
        
        if name.text?.isEmpty == true {
            print("Please enter name")
            return
        }
        if email.text?.isEmpty == true {
            print("Please enter email")
            return
        }
        if password.text?.isEmpty == true {
            print("Please enter password")
            return
        }
        if repass.text != password.text {
            print("password doesnot match")
            return
        }
        signup()
    }
    
    @IBAction func loginpageTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func signup() {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error:\(error?.localizedDescription)")
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "login")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
}
