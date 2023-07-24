//
//  AgeVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit



class UserAgeGenderVC: UIViewController {
    
    var user: User?
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var agePicker: UIDatePicker!
    
    let genders = ["Male", "Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("NAME IS \(String(describing: user?.name))")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpButton()
        setUpPicker()
        
    }
    @IBAction func genderSelected(_ sender: Any) {
        
        
    }
    
    @IBAction func dateSelected(_ sender: Any) {

    }
    
    func setUpViews(){
        setUpButton()
    }
    
    func showAlert(_ message: String, _ title: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
             }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setUpButton(){
        continueButton.layer.cornerRadius = 10
    }
    
    func setUpPicker(){
        agePicker.setValue(UIColor(named: "secondary"), forKey: "backgroundColor")
        agePicker.layer.cornerRadius = 10
        agePicker.layer.masksToBounds = true
        agePicker.tintColor = UIColor(named: "primary")
        agePicker.maximumDate = Date.now
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        user?.gender = genders[gender.selectedSegmentIndex]
        user?.age = agePicker.date
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "heightWeight"{
            let destinationVC =  segue.destination as! UserHeightWeightVC
            
            destinationVC.user = user
        }
        
    }
    
}
