//
//  ExpertViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 14/11/23.
//

import UIKit

class ExpertViewController: UIViewController {

    func sendData(a: Int){
        data.shared.dataTopass = a
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn5(_ sender: Any) {
        sendData(a: 5)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "result")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    

    @IBAction func btn6(_ sender: Any) {
        sendData(a: 6)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "result")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func btn7(_ sender: Any) {
        sendData(a: 7)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "result")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func btn8(_ sender: Any) {
        sendData(a: 8)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "result")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
}
