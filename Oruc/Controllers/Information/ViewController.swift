//
//  ViewController.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let sections = MockData.shared.pageData
    
    var infoTitle = ""
    
    var infoDesc = ""
    
    var infoImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createLayout()
    }

    private func createLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout {[weak self]sectionIndex, layoutEnvironment in
            guard let self = self else {return nil}
            let section = self.sections[sectionIndex]
            
            switch section{
            case .suggestions:
                // Item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                // Group
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(150), heightDimension: .absolute(150)), subitems: [item])
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
                section.boundarySupplementaryItems = [supplementaryHeaderItem()]
                return section
            case .about:
                // Item
                //fills the width and height
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                // Group
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.5)), subitems: [item])
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 0, leading: 10, bottom: 20, trailing: 10)
                section.boundarySupplementaryItems = [supplementaryHeaderItem()]
                return section
            }
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetail"{
            let destinationVC = segue.destination as! InfoDetailViewController
            
            destinationVC.infoTitle = self.infoTitle
            destinationVC.desc = self.infoDesc
            destinationVC.image = self.infoImage
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .suggestions(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestionsCVC", for: indexPath) as! SuggestionsCVC
            cell.setup(items[indexPath.row])
            return cell
        case .about(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AboutCVC", for: indexPath) as! AboutCVC
            cell.setup(items[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewHeaderReusableView", for: indexPath) as! CollectionViewHeaderReusableView
            header.setup(sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch sections[indexPath.section] {
        case .suggestions(let items):
            print(items[indexPath.row])
            infoTitle = items[indexPath.row].title
            infoDesc = items[indexPath.row].desc
            infoImage = items[indexPath.row].image
            performSegue(withIdentifier: "toDetail", sender: self)
        case .about(let items):
            print(items[indexPath.row])
        }
    }
}
