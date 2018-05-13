//
//  AuthVC.swift
//  breakpoint
//
//  Created by Koki Tabayashi on 2018/05/12.
//  Copyright © 2018年 Koki Tabayashi. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
    
}
