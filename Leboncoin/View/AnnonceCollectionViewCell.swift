//
//  AnnonceCollectionViewCell.swift
//  Leboncoin
//
//  Created by Sylla on 25/04/2022.
//

import UIKit

class AnnonceCollectionViewCell: UICollectionViewCell {
    static let identifier = "AnnonceCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView =  UIImageView()
        imageView.backgroundColor = .yellow
        imageView.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.textAlignment = .center
        label.text = "Custom"
        return label
    }()
    
    private let myLabel2: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.text = "Custom2"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel2)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
        
        myImageView.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: -50)
        
        myLabel2.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 20)
        
        
        
    }
    
    public func configure(label: String, image: String, label2: String) {
        myLabel.text = label
        myLabel2.text = label2
        myImageView.image = UIImage(systemName: image)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
}
