//
//  LandingVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit
import FirebaseAuth

class LandingVC: UIViewController {

    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpLoginButton(button: registerButton)
        setUpLoginButton(button: loginButton)
        isUserSignedIn() ? go() : nil
    }
    
    func isUserSignedIn() -> Bool{
        
        return Auth.auth().currentUser != nil ? true : false
    }
    
    func go(){
        performSegue(withIdentifier: "goLandingToHomeVC", sender: self)
    }
    
    func setUpLoginButton(button: UIButton){
        button.layer.cornerRadius = 15
        //button.alpha = 0.5
        //button.isEnabled = false
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
