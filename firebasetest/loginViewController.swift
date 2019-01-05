//
//  loginViewController.swift
//  firebasetest
//
//  Created by berk birkan on 8.10.2017.
//  Copyright © 2017 berk birkan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import GoogleSignIn

class loginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passtext: UITextField!
    @IBAction func signinbutton(_ sender: UIButton) {
        if emailtext.text! != "" && passtext.text! != ""{
            
            Auth.auth().signIn(withEmail: emailtext.text!, password: passtext.text!, completion: { (user, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okbutton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okbutton)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: "totabbar", sender: nil)
                }
            })
        }else{
            let alert = UIAlertController(title: "Error", message: "Email and pass requered", preferredStyle: UIAlertControllerStyle.alert)
            let okbutton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okbutton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func signupbutton(_ sender: UIButton) {
        if emailtext.text! != "" && passtext.text! != ""{
            Auth.auth().createUser(withEmail: emailtext.text!, password: passtext.text!, completion: { (user, error) in
                if error != nil{
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okbutton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okbutton)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: "totabbar", sender: nil)
                }
            })
        }else{
            let alert = UIAlertController(title: "Error", message: "Email and pass requered", preferredStyle: UIAlertControllerStyle.alert)
            let okbutton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okbutton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        /*var error : NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil{
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
        let googlesigninbutton = GIDSignInButton()
        googlesigninbutton.center = view.center
        view.addSubview(googlesigninbutton)*/

        // Do any additional setup after loading the view.
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print("some error")
            return
        }
    }
}
