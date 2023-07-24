//
//  TargetWeightHeightVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit

class TargetWeightVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var targetWeightPicker: UIPickerView!
    
    var user: User?
    
    var selectedWeight: Decimal = 70.0

    var weights: [Decimal] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetWeightPicker.delegate = self
        targetWeightPicker.dataSource = self
        
        print("Weight IS \(String(describing: user?.weight))")
        print("Height IS \(String(describing: user?.height))")
        print("NAME IS \(String(describing:user?.name))")
        generateNumbers()
        // Do any additional setup after loading the view.
        targetWeightPicker.selectRow((user?.weight!.intValue)! * 8, inComponent: 0, animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpPicker()
        setUpButton()
    }
    
    func setUpButton(){
        continueButton.layer.cornerRadius = 10
    }
    
    func setUpPicker(){
        
        targetWeightPicker.setValue(UIColor(named: "secondary"), forKeyPath: "textColor")
        targetWeightPicker.layer.cornerRadius = 10
        targetWeightPicker.layer.masksToBounds = true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func generateNumbers(){
        var i: Decimal = 0.0
        if let weight = user?.weight{
            while i < weight as Decimal{
                
                i += 0.1
                
                weights.append(i)
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            return weights.count

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

            return "\(weights[row].description) kg"

        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            return selectedWeight = weights[row]

    }
    
    @IBAction func continuePressed(_ sender: Any) {
        user?.targetWeight = ((selectedWeight) as NSDecimalNumber)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "programDifficulty"{
            let destinationVC =  segue.destination as! ProgramDifficultyVC
            
            destinationVC.user = user
        }
        
    }

}
