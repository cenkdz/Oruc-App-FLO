//
//  AboutCVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import UIKit

final class AboutCVC: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellTitleLbl.text = item.title
    }
}
