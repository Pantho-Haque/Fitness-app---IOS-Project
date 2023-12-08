//
//  CongoViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 16/11/23.
//

import UIKit

class CongoViewController: UIViewController {

    var rd: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        rd = data.shared.dataTopass
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
                    guard let self = self else { return }

                    if self.rd! >= 1 && self.rd! <= 4 {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(identifier: "noviceex")
                        vc.modalPresentationStyle = .overFullScreen
                        self.present(vc, animated: true)
                    } else {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(identifier: "expert")
                        vc.modalPresentationStyle = .overFullScreen
                        self.present(vc, animated: true)
                    }
                }
    }
    

    

}
