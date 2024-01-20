//
//  ViewController.swift
//  InstaClone-Firebase
//
//  Created by Burak Yıldız on 15.01.2024.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
          
    }
    
   
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { data, error in
                if error != nil {
                    self.showAlert(title: "ERROR", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            showAlert(title: "ERROR", message: "USERNAME-PASSWORD CANNOT BE EMPTY!!")
        }
        
    }
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { data, error in
                if error != nil{
                    self.showAlert(title: "ERROR", message: error?.localizedDescription ?? "ERROR")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            showAlert(title: "ERROR", message: "USERNAME-PASSWORD CANNOT BE EMPTY!!")
        }
    }
    
    func showAlert(title:String , message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}



 
