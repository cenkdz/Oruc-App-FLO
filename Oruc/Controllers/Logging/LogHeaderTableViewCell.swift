//
//  LogHeaderTableViewCell.swift
//  Oruc
//
//  Created by Cenk Donmez on 22.07.2023.
//

import UIKit

class LogHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(text: String, date: String){
        label.text = text
        dateLabel.text = date
    }

}
