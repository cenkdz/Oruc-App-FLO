//
//  LogVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 22.07.2023.
//

import UIKit

class LogVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fasts: [FData] =  []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        fasts = CoreDataManager.shared.getFasts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logCell", for: indexPath) as! LogTableViewCell
        cell.setCell(text: ((fasts[indexPath.row].endDate?.timeIntervalSince(fasts[indexPath.row].startDate!))! / 3600).rounded().description + " saat", date: (fasts[indexPath.row].endDate?.formatted(date: .abbreviated, time: .shortened))!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
