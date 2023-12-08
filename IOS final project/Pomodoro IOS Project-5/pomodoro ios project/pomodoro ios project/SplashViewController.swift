//
//  SplashViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 26/11/23.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
                    guard let self = self else { return }
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(identifier: "login")
                        vc.modalPresentationStyle = .overFullScreen
                        self.present(vc, animated: true)
                }
    }
    

    

}
