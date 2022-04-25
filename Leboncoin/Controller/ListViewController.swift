//
//  ViewController.swift
//  Leboncoin
//
//  Created by Sylla on 22/04/2022.
//

import UIKit

class ListViewController: UIViewController{

    var annonce: [Annonce]?
    
    private var collectionView: UICollectionView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of annonce"
        view.backgroundColor = .systemBackground
        collectionView?.reloadData()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/3)-4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(AnnonceCollectionViewCell.self, forCellWithReuseIdentifier: AnnonceCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    func callAPi(){
        DataService.shared.getAnnonce {[weak self] annonces in
            switch annonces{
            case .success(let annonces):
                self?.annonce = annonces
                print("api charged")
            case .failure:
                print("error")
            }
        }
    }
    
    
    
    
}
extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return annonce?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnnonceCollectionViewCell.identifier, for: indexPath) as! AnnonceCollectionViewCell
        
        //cell.contentView.backgroundColor = .systemBlue
        cell.configure(label: "Custom \(indexPath.row)", image: "house", label2: "ledon")
        return cell
    }
}



