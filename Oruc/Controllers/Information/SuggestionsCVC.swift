//
//  SuggestionsCVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import UIKit

final class SuggestionsCVC: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellImageView.layoutIfNeeded()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
    }
}
