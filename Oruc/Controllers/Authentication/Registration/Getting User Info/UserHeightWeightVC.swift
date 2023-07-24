//
//  UserHeightWeightVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit

class UserHeightWeightVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var weightPicker: UIPickerView!
    @IBOutlet weak var heightPicker: UIPickerView!
    
    var user: User?
    
    var selectedWeight: Decimal = 70.0
    
    var selectedHeight = 65
    
    var weights: [Decimal] = []
    
    var heights = (60...260).map {$0}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateNumbers()
        print("Age IS \(String(describing: user?.age))")
        print("Age IS \(String(describing: user?.gender))")
        // Do any additional setup after loading the view.
        weightPicker.selectRow(749, inComponent: 0, animated: false)
        heightPicker.selectRow(105, inComponent: 0, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpPicker()
        setUpButton()
    }
    
    func setUpButton(){
        continueButton.layer.cornerRadius = 10
    }
    
    func setUpPicker(){
        weightPicker.setValue(UIColor(named: "secondary"), forKeyPath: "textColor")
        heightPicker.setValue(UIColor(named: "secondary"), forKeyPath: "textColor")
        weightPicker.layer.cornerRadius = 10
        weightPicker.layer.masksToBounds = true
        heightPicker.layer.cornerRadius = 10
        heightPicker.layer.masksToBounds = true
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        
        user?.weight = ((selectedWeight) as NSDecimalNumber)
        user?.height = Int64(selectedHeight)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func generateNumbers(){
        var i: Decimal = 0.0
        while i < 600.0{
            
            i += 0.1
            
            weights.append(i)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return heights.count
        } else {
            return weights.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return "\(heights[row].description) cm"
        } else {
            return "\(weights[row].description) kg"
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            return selectedHeight = heights[row]
        } else {
            return selectedWeight = weights[row]
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "targetWeight"{
            let destinationVC =  segue.destination as! TargetWeightVC
            
            destinationVC.user = user
        }
        
    }
    
    
    
}
