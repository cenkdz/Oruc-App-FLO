//
//  WeightTrackerVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 11.07.2023.
//

import UIKit

class WeightTrackerVC: UIViewController {
    private let viewModel = WeightTrackerVM()
    
    @IBOutlet weak var bmiDescription: UITextView!
    @IBOutlet weak var BMI: UITextView!
    @IBOutlet weak var endWeight: UITextView!
    @IBOutlet weak var startWeight: UITextView!
    @IBOutlet weak var currentWeight: UITextView!
    
    func setUpBinders() {
//        viewModel.scenario.bind { [weak self] scenario in
//            if let scenario = scenario{
//                switch scenario {
//                case .fTimeRunningOvertime:
//                    self?.setViewsOverTimeStarted()
//                case .fTimerEndedByItself:
//                    self?.setViewsTimerEnded()
//                case .fTimerEndedByUser:
//                    self?.setViewsTimerStopped()
//                    //case .fTimerNotSet:
//                case.fTimerStarted:
//                    self?.setViewsTimerRunning()
//                    //case .fTimerStartedFirstTime
//                default:
//                    print("Error there isn't any scenario for this situation")
//                }
//            }
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinders()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setViews()
    }
    
    func setViews(){
        let user = CoreDataManager.shared.getUserData().first
        let weight = user?.weight?.doubleValue
        let height = Double((user?.height)!) * 0.01
       // let bmi = weight / (height * 2)
        
        let bmi = weight! / (height * height)
        
        //let bmi = user?.weight!.int64Value / (user?.height * 2)
        
            bmiDescription.text = viewModel.getBmiDescription(bmi: Decimal(bmi))
            BMI.text = String(format:"%.2f", bmi)
            endWeight.text = user?.targetWeight?.description
            startWeight.text = user?.weight?.description
            currentWeight.text = user?.weight?.description
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func updatePressed(_ sender: Any) {
    }
    
}
