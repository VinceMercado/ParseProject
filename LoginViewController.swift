//
//  LoginViewController.swift
//  ParseProject
//
//  Created by Vince  on 2/23/17.
//  Copyright © 2017 Vince Mercado. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        let user = PFUser()
        user.username = emailField.text
        user.password = passwordField.text
        user.email = emailField.text
        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                self.showAlert(errorMsg: error.localizedDescription)
            } else {
                // Hooray! Let them use the app now.
                self.loginSegue()
            }
            
        }
    }
        
        
    @IBAction func Login(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailField.text!, password: passwordField.text!) { (succedded: PFUser?, error: Error?) -> Void in
            if let error = error {
                self.showAlert(errorMsg: error.localizedDescription)
            } else {
                // Hooray! Let them use the app now.
                self.loginSegue()
            }
        }
    }
    func showAlert(errorMsg: String) {
        let alertController = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        // create a cancel action
        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
    }
    func loginSegue(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NavigagtioController")
        self.present(vc, animated: true, completion: nil)
        
    }
    
 
}
