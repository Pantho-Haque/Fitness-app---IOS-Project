//
//  NoviceViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 14/11/23.
//

import UIKit

class NoviceViewController: UIViewController {
    func sendData(a: Int){
        data.shared.dataTopass = a
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btn1(_ sender: Any) {
        sendData(a: 1)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "result")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @IBAction func btn2(_ sender: Any) {
        sendData(a: 2)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "result")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func btn3(_ sender: Any) {
        sendData(a: 3)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "result")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func btn4(_ sender: Any) {
        sendData(a: 4)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "result")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
   
}
