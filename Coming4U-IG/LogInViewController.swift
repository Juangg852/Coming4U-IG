//
//  LogInViewController.swift
//  Coming4U-IG
//
//  Created by Juan Gonzalez on 10/12/21.
//

import UIKit
import Parse

class LogInViewController: UIViewController {
    @IBOutlet weak var UserNameField: UITextField!
    
    
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignIn(_ sender: Any) {
        let username = UserNameField.text!
        let password = PasswordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "LogInSague", sender: nil)
                print ("you have logged in")
            }
            else {
                print ("error: \(error?.localizedDescription)")
            }
        }
    }
    
    
    
    @IBAction func SignUP(_ sender: Any) {
        let user = PFUser()
        user.username = UserNameField.text
        user.password = PasswordField.text
            

            // other fields can be set just like with PFObject
        user.signUpInBackground { success, error in
            if success{
                self.performSegue(withIdentifier: "LogInSague", sender: nil)
            }
            else {
                print ("error: \(error?.localizedDescription)")
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
