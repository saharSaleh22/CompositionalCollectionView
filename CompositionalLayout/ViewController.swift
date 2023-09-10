//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by K on 10/09/2023.
//

import UIKit

class ViewController: UIViewController {
    private let images :[UIImage?] = Array(1 ... 13).map{UIImage(named: String($0))}

    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
        // Do any additional setup after loading the view.
    }
    private func createLayout() -> UICollectionViewCompositionalLayout{
        // item
        let item1 = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 1)
        let item2 = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 1)
        let item3 = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.5), spacing: 1)

        let horizantalGroup = CompositionalLayout.createGroup(alignment: .horizantal, width: .fractionalWidth(1), height: .fractionalHeight(0.5), item: item2 , count: 2)
        let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), items:[horizantalGroup , item3])
        //group
        let group = CompositionalLayout.createGroup(alignment: .horizantal, width: .fractionalWidth(1), height: .fractionalHeight(0.3), items: [item1 , verticalGroup])
        
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
//        //group
     // let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.3)), repeatingSubitem: item, count: 2)
        //section
        let section = NSCollectionLayoutSection(group: group)
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }


}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell
        cell.setup(image: images[indexPath.row]!)
        return cell
    }
    
    
}

class myCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    func setup (image : UIImage){
        imageView.image = image
    }
   
}

