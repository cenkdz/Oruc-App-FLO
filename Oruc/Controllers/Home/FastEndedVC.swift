//
//  FastEndedVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 2.07.2023.
//

import UIKit

class FastEndedVC: UIViewController {
    
    // USER DEFAULTS
    //let userDefaults = UserDefaults.standard
    let defaults = UserDefaults.standard
    let START_TIME_KEY = "startTime"
    let STOP_TIME_KEY = "stopTime"
    let COUNTING_KEY = "countingKey"
    
    var startingTime = 0.0
    var endingTime = 0.0
    
    var startDate: Date? = nil
    var endDate: Date? = nil
    
    var fastingDuration: TimeInterval?
    
    // Data
    var timers: [FastingTimer] = []
    
    // Reference to the managed object context
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let viewModel = HomeVM()
    let group = DispatchGroup()
    
    @IBOutlet weak var fastingDurationLabel: UILabel!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //startDatePicker.setValue(, forKeyPath: "textColor")
        startDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        startDatePicker.setValue(false, forKeyPath: "highlightsToday")
        if self.modalPresentationStyle == .formSheet{
            print("SHEET ACTIVATED")
            //self.isEditing = false
            //self.isModalInPresentation = true
        }
        if let sheetController = self.presentationController as? UISheetPresentationController {
            sheetController.detents = [.medium()]
            sheetController.prefersGrabberVisible = true
            sheetController.preferredCornerRadius = 30
            sheetController.prefersScrollingExpandsWhenScrolledToEdge = true
            sheetController.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheetController.prefersScrollingExpandsWhenScrolledToEdge = false
        }
    }
    
    func setUpButtons(){
        completeButton.layer.cornerRadius = 10
        backButton.layer.cornerRadius = 10
    }
    
    func timeString(time:TimeInterval) -> String {
        return String(format:"%02i:%02i:%02i", Int(time) / 3600, Int(time) / 60 % 60, Int(time) % 60)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpButtons()
        fastingDurationLabel.text = timeString(time: fastingDuration!)
        endDatePicker.maximumDate = Date.now
        endDatePicker.minimumDate = startDate
        startDatePicker.maximumDate = endDatePicker.date
        startDatePicker.minimumDate = Date.now.advanced(by: -(60 * 60 * 100))
        startDatePicker.date = startDate!
        endDatePicker.date = endDate!
    }
    
    @IBAction func completePressed(_ sender: Any) {
        // BUNLARI FIREBASE E YOLLANACAK!
        //startingTime = startDatePicker.date.timeIntervalSince1970
        //endingTime = endDatePicker.date.timeIntervalSince1970
        viewModel.resetTimer()
        viewModel.resetOvertimeTimer()
        viewModel.stopTimer()
        FirebaseHelper.shared.addFastingData(startDate: startDate!, endDate: endDate!)
        CoreDataManager.shared.addFast(start: startDate!, end: endDate!)
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        performSegue(withIdentifier: "fastEndedtoHome", sender: self)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
         
         
         if segue.identifier == "fastEndedtoHome"{
             //let destination = segue.destination as! HomeVC
             
                // ..destination.
         }
     }
    @IBAction func startDateEdited(_ sender: Any) {
        print(startDatePicker.date.description)
        startDate = startDatePicker.date
        endDatePicker.minimumDate = startDatePicker.date
        calculateNewFastingLength()
    }
    
    @IBAction func endDateEdited(_ sender: Any) {
        print(endDatePicker.date.description)
        endDate = endDatePicker.date
        startDatePicker.maximumDate = endDatePicker.date
        calculateNewFastingLength()
    }
    
    func calculateNewFastingLength(){
        fastingDurationLabel.text = timeString(time: endDate!.timeIntervalSince(startDate!))
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
