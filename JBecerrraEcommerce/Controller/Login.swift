//
//  Login.swift
//  JBecerrraEcommerce
//
//  Created by MacbookMBA7 on 09/01/23.
//

import FirebaseAuth
import UIKit

class Login : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func Login(email : String, password : String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else {
              
              return }
            self?.performSegue(withIdentifier: "login", sender: self)
        }
    }
}

