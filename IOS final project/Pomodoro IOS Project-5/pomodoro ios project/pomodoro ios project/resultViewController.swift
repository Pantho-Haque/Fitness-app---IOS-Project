//
//  resultViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 14/11/23.
//

import UIKit

class resultViewController: UIViewController {

    var rd: Int?
    var timer: Timer?
    var counterValue: Int = 10 // Default value
    
    @IBOutlet var txt: UILabel!
    
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var counter: UILabel!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var pauseButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pauseButton.isHidden=true
        
        rd = data.shared.dataTopass
        // Do any additional setup after loading the view.
        if(rd == 1){
            txt.text = "Procedure: Stand with feet wider than hip width, toes facing front. Drive hips back, sit in squat position, chest up, shoulders back, reach parallel, press into heels, and return to standing upright."
            img.image = UIImage(imageLiteralResourceName: "IMG_20231114_110151")
            counterValue = 15
        }
        else if(rd == 2){
            txt.text = "High Stepping requires a small step stool or standing in front of stairs, primarily pushing through the lead foot, lifting the body onto the step and then returning to the starting position."
            img.image = UIImage(imageLiteralResourceName: "IMG_20231114_110426")
            counterValue = 30
        }
        else if(rd == 3){
            txt.text = "Lying on the floor, with feet close together, place palms flat, and straighten elbows. Lift upper body off the ground, draw shoulder blades back, drop shoulders, open chest muscles, and focus on lifting chest toward the sky. Release as you lower back."
            img.image = UIImage(imageLiteralResourceName: "IMG_20231114_110231")
            counterValue = 30
        }
        else if(rd == 4){
            txt.text = "Position yourself in a plank position with your forearms and toes on the floor, relaxed, and your head relaxed. Engage abdominal muscles, maintain a neutral spine position."
            img.image = UIImage(imageLiteralResourceName: "plank")
            counterValue = 20
        }
        else if(rd == 5){
            txt.text = "Perform a 45-degree leg raise and lower exercise, keeping your core engaged and alternating between legs to maintain a straight and engaged body."
            img.image = UIImage(imageLiteralResourceName: "IMG_20231114_110610")
            counterValue = 30
            
        }
        else if(rd == 6){
            txt.text = "Perform a series of quick, dynamic exercises, maintaining proper posture and avoiding slouching or twisting your toes, continue repetitions for six sets."
            img.image = UIImage(imageLiteralResourceName: "IMG_20231114_110344")
            counterValue = 40
            
        }
        else if(rd == 7){
            txt.text = "Perform a tabletop pose with knees under hips, hands under shoulders, and neutral spine. Draw shoulder blades, raise arms and legs parallel to floor, and gaze downwards."
            img.image = UIImage(imageLiteralResourceName: "IMG_20231114_110811")
            counterValue = 30
        }
        else if(rd == 8){
            txt.text = "Sit on stomach, prop up forearms, lift hips off floor, use core muscles, lower hips, relax, and repeat."
            img.image = UIImage(imageLiteralResourceName: "IMG_20231114_110302")
            counterValue = 50
            
        }
        else{
            txt.text = "None"
        }
        counter.text = counterValue/10 != 0 ? "\(counterValue)" : "0\(counterValue)"
    }
    
    
    @IBAction func startCounter(_ sender: Any) {
        if timer == nil {
                    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
                }
        startButton.isHidden=true
        pauseButton.isHidden=false
    }
    
    @IBAction func pauseCounter(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        startButton.isHidden=false
        pauseButton.isHidden=true
    }
    
    @objc func updateCounter() {
            if counterValue > 0 {
                counterValue -= 1
                counter.text = counterValue/10 == 0 ? "0\(counterValue)" : "\(counterValue)"
            } else {
                timer?.invalidate()
                timer = nil
              
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "congo")
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: true)
            }
        }

    
    
    @IBAction func backBtn(_ sender: Any) {
        if(rd!>=1 && rd!<=4){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "noviceex")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "expert")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        
    }
    
    

}
