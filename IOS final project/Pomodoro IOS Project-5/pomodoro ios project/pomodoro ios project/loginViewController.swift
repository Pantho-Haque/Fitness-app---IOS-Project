//
//  loginViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 12/11/23.
//

import UIKit
import FirebaseAuth
import Firebase

class loginViewController: UIViewController {

    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry=true;
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        ValidateFeilds()
    }
    
    @IBAction func createaccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "signup")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func forgotTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "forgot")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func ValidateFeilds(){
        if email.text?.isEmpty == true{
            print("No Email Text")
            return
        }
        
        if password.text?.isEmpty == true{
            print("No Email Text")
            return
        }
        
        login()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!){ [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err{
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "menu")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
}
