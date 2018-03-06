//
//  LoginViewController.swift
//  Instantgram
//
//  Created by somi on 3/5/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
  
  @IBOutlet var usernameField: UITextField!
  
  @IBOutlet var passwordField: UITextField!
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


  @IBAction func onSignIn(_ sender: Any) {
    let username = usernameField.text ?? ""
    let password = passwordField.text ?? ""
    PFUser.logInWithUsername(inBackground: username, password: password) {
      (user: PFUser?, error: Error?) in
      if let error = error {
        print("\(error.localizedDescription)")
        switch error._code {
        case 101:
          AlertView.viewAlert(view: self, title: "User log in failed", message: "\(error.localizedDescription)")
        default:
          AlertView.viewAlert(view: self, title: "User log in failed", message: "\(error.localizedDescription)")
        }
      } else {
        print("User logged in successfully")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
      }
    }
  }
  
  
  @IBAction func onSignUp(_ sender: Any) {
    let newUser = PFUser()
    newUser.username = usernameField.text
    newUser.password = passwordField.text
    newUser.signUpInBackground { (success: Bool, error: Error?) in
      if let error = error {
        print(error.localizedDescription)
        AlertView.viewAlert(view: self, title: "User sign up failed", message: "\(error.localizedDescription)")
      } else {
        print("User Registered Successfully")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
      }
    }
    
  }
  
  
  
  
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
