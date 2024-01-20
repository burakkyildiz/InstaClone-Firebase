//
//  SettingsVC.swift
//  InstaClone-Firebase
//
//  Created by Burak Yıldız on 20.01.2024.
//

import UIKit
import FirebaseAuth
class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutClicked(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewVC", sender: nil)
        }
        catch{
            print("error")
        }
    }
    
    

}
