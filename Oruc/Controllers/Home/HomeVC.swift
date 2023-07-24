//
//  HomeVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 28.06.2023.
//

import UIKit
import HGCircularSlider
import FirebaseAuth
import NotificationCenter

class HomeVC: UIViewController {
    
    private let viewModel = HomeVM()
    
    func setUpBinders() {
        viewModel.progress.bind { [weak self] progress in
            if self?.viewModel.scenario.value == .fTimeRunningOvertime{
                if let progressValue = self?.viewModel.progress.value{
                    self?.overTimeLabel.text = "+ " + (self?.viewModel.timeString(time: progressValue))!
                    //self?.timerView.endPointValue = progressValue
                }
            }else{
                if let progressValue = self?.viewModel.progress.value{
                    self?.timeLeftLabel.text = self?.viewModel.timeString(time: progressValue)
                    self?.timerView.endPointValue = progressValue
                }
            }
            if let startDate =  self?.defaults.object(forKey: "startDate"){
                self?.setUpStageTitleText(startDate: startDate as! Date)
            }
        }
        viewModel.scenario.bind { [weak self] scenario in
            if let scenario = scenario{
                switch scenario {
                case .fTimeRunningOvertime:
                    self?.setViewsOverTimeStarted()
                case .fTimerEndedByItself:
                    self?.setViewsTimerEnded()
                case .fTimerEndedByUser:
                    self?.setViewsTimerStopped()
                    //case .fTimerNotSet:
                case.fTimerStarted:
                    self?.setViewsTimerRunning()
                default:
                    print("Error there isn't any scenario for this situation")
                }
            }
        }
    }
    
    // OUTLETS
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var timeSelectionPopUp: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var customStack: UIStackView!
    @IBOutlet weak var infoLabel: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    
    // SUBVIEWS
    var timeLeftLabel: UILabel!
    var overTimeLabel: UILabel!
    var timerView: RangeCircularSlider!
    
    var selectedProgram: FProgram = .sixteen
    
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationManager.shared.requestAuthorization()
        
       // NotificationManager().scheduleNotification(subtitle: "Aralikli oruc zamanin geldi!", hour: <#Int#>, minute: <#Int#>)
        
        selectedProgram = viewModel.getProgramDifficulty()
        setUpBinders()
        // Initialize views
        timerView = RangeCircularSlider(frame: customStack.frame)
        timeLeftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: timerView.frame.width / 2, height: timerView.frame.height / 2))
        overTimeLabel = UILabel(frame: CGRect(x: timerView.bounds.width / 3.1, y: timerView.bounds.height / 1.5, width: timerView.frame.width / 3, height: timerView.frame.height / 3))
        
        // Set up subview appearances
        setUpTimerView()
        setUpTimeLabelView()
        setUpOverTimeLabelView()
        setUpAllButtons()

        // Adding TimerView to the stack
        customStack.addSubview(timerView)
        
        // Adding TimeLabel to the stack
        customStack.addSubview(timeLeftLabel)
        customStack.addSubview(overTimeLabel)
        
        populatePopUpButton()
        if let startDate = defaults.object(forKey: "startDate"){
            if let overtime = defaults.object(forKey: "overtimeStartDate"){
                viewModel.startOverTimeTimer()
               // timerView.maximumValue = CGFloat(selectedProgram.rawValue)
            }else{
                viewModel.startTimer(program: selectedProgram)
                timerView.maximumValue = CGFloat(selectedProgram.rawValue)
            }
            
        }else{
            setViewsFirstTime()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isUserSignedIn() ? nil : goToLogin()
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    
    @IBAction func mainButtonSelected(_ sender: Any) {
        if viewModel.scenario.value == .fTimerStarted || viewModel.scenario.value == .fTimeRunningOvertime{
            go()
        }else{
            viewModel.startTimer(program: selectedProgram)
            timerView.maximumValue = CGFloat(selectedProgram.rawValue)
        }
    }
    
    @IBAction func cancelButtonSelected(_ sender: Any) {
        viewModel.stopTimer()
        viewModel.resetTimer()
        viewModel.scenario.value = .fTimerEndedByUser
    }
    
    // MARK: - Navigation
    func isUserSignedIn() -> Bool{
        return Auth.auth().currentUser != nil ? true : false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let startDate = defaults.object(forKey: "startDate")
        
        if segue.identifier == "fastEndedVC"{
            let destination = segue.destination as! FastEndedVC
            destination.endDate = Date.now
            destination.startDate = startDate as? Date
            destination.fastingDuration = Date.now.timeIntervalSince(((startDate as? Date)!) )
        }else if segue.identifier == "goToFastInfo"{
            let destination = segue.destination as! StageViewController
            destination.startDate = startDate as? Date
        }
    }
    
    
    @IBAction func infoButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "goToFastInfo", sender: self)
    }
    
    func go(){
        performSegue(withIdentifier: "fastEndedVC", sender: self)
    }
    
    
    func goToLogin(){
        performSegue(withIdentifier: "goToLanding", sender: self)
    }
    
    
    func populatePopUpButton(){
        let sixteen = { (action: UIAction) in
            print(action.title)
            self.timeSelectionPopUp.setText(action.title)
            self.selectedProgram = .sixteen
            self.timerView.maximumValue = self.selectedProgram.rawValue
            
        }
        let eighteen = { (action: UIAction) in
            print(action.title)
            self.timeSelectionPopUp.setText(action.title)
            self.selectedProgram = .eighteen
            self.timerView.maximumValue = self.selectedProgram.rawValue
            
        }
        let twenty = { (action: UIAction) in
            print(action.title)
            self.timeSelectionPopUp.setText(action.title)
            self.selectedProgram = .twenty
            self.timerView.maximumValue = self.selectedProgram.rawValue
            
        }
        timeSelectionPopUp.menu = UIMenu(children: [
            UIAction(title: "16 - 8", handler: sixteen),
            UIAction(title: "18 - 6", handler: eighteen),
            UIAction(title: "20 - 4", handler: twenty)
        ])
        timeSelectionPopUp.showsMenuAsPrimaryAction = true
    }
    
    // VIEW RELATED
    
    func setUpAllButtons(){
        mainButton.layer.cornerRadius = 10
        timeSelectionPopUp.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
    }
    
    func setUpTimerView(){
        if let timerView = timerView{
            // TimerView Alignment
            timerView.center = customStack.center
            
            // TimerView Colors
            timerView.trackFillColor = UIColor(named: "accent")!
            timerView.diskColor = UIColor(named: "primary")!
            timerView.endThumbStrokeColor = UIColor(named: "accent")!
            timerView.backgroundColor = UIColor(named: "primary")!
            
            // TimerView Settings
            timerView.minimumValue = 0.0
            timerView.endPointValue = 0.0
            
            
            timerView.lineWidth = 30
            timerView.stopThumbAtMinMax = true
            timerView.isUserInteractionEnabled = false
            // TimerView Icons
            timerView.startThumbImage = UIImage(systemName: "hourglass")?.withTintColor(UIColor(named: "secondary")!)
        }else{
            print("Error setting up TimerView")
        }
    }
    
    func setViewsFirstTime(){
        mainButton.setText("Oruca başla")
        //mainButton.setTitle("Oruca başla", for: .normal)
        timeLeftLabel.text = ("Hazırsan başlayalım")
        timeSelectionPopUp.isEnabled = true
        timeSelectionPopUp.isHidden = false
        cancelButton.isHidden = true
        overTimeLabel.isHidden = true
        infoLabel.isHidden = true
        infoButton.isHidden = true
    }
    func setViewsTimerRunning(){
        timeLeftLabel.text = ("")
        mainButton.setText("Orucu bitir")
        //mainButton.setTitle("Orucu bitir", for: .normal)
        timeSelectionPopUp.isHidden = true
        cancelButton.isHidden = false
        overTimeLabel.isHidden = true
        infoLabel.isHidden = false
        infoButton.isHidden = false
    }
    func setViewsTimerStopped(){
        mainButton.setText("Oruca başla")
        mainButton.setTitle("Oruca başla", for: .normal)
        timeLeftLabel.text = ("Hazırsan başlayalım")
        timeSelectionPopUp.isEnabled = true
        timeSelectionPopUp.isHidden = false
        cancelButton.isHidden = true
        timerView.endPointValue = 0.0
        overTimeLabel.isHidden = true
        infoLabel.isHidden = true
        infoButton.isHidden = true
    }
    
    func setViewsTimerEnded(){
        mainButton.setText("Tekrar oruca başla")
        //mainButton.setTitle("Tekrar oruca başla", for: .normal)
        timeLeftLabel.text = ("Tebrikler!")
        timeSelectionPopUp.isEnabled = true
        timeSelectionPopUp.isHidden = false
        cancelButton.isHidden = true
        //timerView.endPointValue = 0.0
        overTimeLabel.isHidden = true
        infoLabel.isHidden = true
        infoButton.isHidden = true
    }
    
    func setViewsOverTimeStarted(){
        mainButton.setText("Orucu bitir")
        //mainButton.setTitle("Orucu bitir", for: .normal)
        timeLeftLabel.text = ("Tamamlandı")
        timeSelectionPopUp.isEnabled = false
        timeSelectionPopUp.isHidden = true
        cancelButton.isHidden = true
        overTimeLabel.isHidden = false
        infoLabel.isHidden = false
        infoButton.isHidden = false
    }
    
    func setUpTimeLabelView(){
        if let timeLeftLabel = timeLeftLabel{
            // TimeLabel Alignment
            timeLeftLabel.center = customStack.center
            
            // TimeLabel Settings
            timeLeftLabel.adjustsFontSizeToFitWidth = true
            timeLeftLabel.textAlignment = .center
            timeLeftLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
            timeLeftLabel.textColor = UIColor(named: "secondary")
        }else{
            print("Error setting up TimeLabel")
        }
    }
    
    func setUpOverTimeLabelView(){
        if let overTimeLabel = overTimeLabel{
            // TimeLabel Settings
            overTimeLabel.adjustsFontSizeToFitWidth = true
            overTimeLabel.textAlignment = .center
            overTimeLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
            overTimeLabel.textColor = UIColor(named: "secondary")
        }else{
            print("Error setting up TimeLabel")
        }
    }
    
    func setUpStageTitleText(startDate: Date){
        let progress = Date().timeIntervalSince(startDate)
        
//        if progress >= 0.0 && progress < 7200.0{
//            infoLabel.text = viewModel.stages[0].stageTitle
//        }else if progress >= 7200.0 && progress < 18000.0{
//            infoLabel.text = viewModel.stages[1].stageTitle
//        }else if progress >= 18000.0 && progress < 28800.0{
//            infoLabel.text = viewModel.stages[2].stageTitle
//        }else if progress >= 28800.0 && progress < 36000.0{
//            infoLabel.text = viewModel.stages[3].stageTitle
//        }else if progress >= 36000.0 && progress < 43200.0{
//            infoLabel.text = viewModel.stages[4].stageTitle
//        }else if progress >= 43200.0 && progress < 64800.0{
//            infoLabel.text = viewModel.stages[5].stageTitle
//        }else{
//            infoLabel.text = viewModel.stages[6].stageTitle
//        }
        
        if progress >= 0.0 && progress < 3.0{
            infoLabel.text = viewModel.stages[0].stageTitle
        }else if progress >= 3.0 && progress < 6.0{
            infoLabel.text = viewModel.stages[1].stageTitle
        }else if progress >= 6.0 && progress < 9.0{
            infoLabel.text = viewModel.stages[2].stageTitle
        }else if progress >= 9.0 && progress < 12.0{
            infoLabel.text = viewModel.stages[3].stageTitle
        }else if progress >= 12.0 && progress < 15.0{
            infoLabel.text = viewModel.stages[4].stageTitle
        }else if progress >= 15.0 && progress < 18.0{
            infoLabel.text = viewModel.stages[5].stageTitle
        }else{
            infoLabel.text = viewModel.stages[6].stageTitle
        }
    }
}

extension UIButton {
    func setText(_ text: String) {
        if let font = titleLabel?.font {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font
            ]
            let attributedTitle = NSAttributedString(string: text, attributes: attributes)
            
            setAttributedTitle(attributedTitle, for: .normal)
        }
    }
}
