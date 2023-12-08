//
//  ViewController.swift
//  Panda_app
//
//  Created by kuetcse on 26/9/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pandaImage: UIImageView!
    
    @IBOutlet weak var btnSwitch: UIButton!
    
    
    @IBOutlet weak var pandaHeading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    
    var sw=0;
    @IBAction func btn(_ sender: Any) {
        if(sw==0){
            pandaImage.image=UIImage(imageLiteralResourceName: "bear")
            pandaHeading.text="Bear"
            btnSwitch.setTitle("Panda", for: .normal)
            sw=1
        }else{
            pandaImage.image=UIImage(imageLiteralResourceName: "panda")
            pandaHeading.text="Panda"
            btnSwitch.setTitle("bear", for: .normal)
            sw=0
        }
        
    }
    
}

