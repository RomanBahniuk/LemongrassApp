//
//  LemongrassView.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 10.01.23.
//

import UIKit
import FirebaseStorage
import FirebaseStorageUI

class CollectionTypeTableViewCell: UITableViewCell {
    
    let colorsManager = ColorsManager.self
    static let reuseIdentifier = "LemongrassTableViewCell"
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.layer.cornerRadius = 16
        containerView.backgroundColor = .white
        containerView.layer.shadowColor = colorsManager.lemongrassColor.cgColor
        containerView.layer.shadowRadius = 1.5
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        containerView.layer.masksToBounds = false
        
        
        return containerView
    }()
    
    
    lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 24)
        categoryLabel.textColor = .systemGray6
        
        return categoryLabel
    }()
    
    lazy var categoryImageView: UIImageView = {
        let categoryImageView = UIImageView()
        categoryImageView.layer.cornerRadius = 16
        categoryImageView.clipsToBounds = true
        
        return categoryImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .systemGray6
        self.separatorInset = .zero
        self.selectionStyle = .none
        
    }
    
    func updateValues(for collectionType: CollectionTypeSettable) {
        
        categoryLabel.text = collectionType.wearCollectionTypeName
        
        let storageRef = Storage.storage().reference()
        let reference = storageRef.child(collectionType.wearCollectionTypeImageURL)
        self.categoryImageView.sd_setImage(with: reference)
        
    }
    
}









extension CollectionTypeTableViewCell {
    
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(categoryImageView)
        containerView.addSubview(categoryLabel)
    }
    
    private func setConstraints() {
        containerViewConstraints()
        categoryImageViewConstraints()
        categoryLabelConstraints()
    }
    
    
    
    private func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
         containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
         containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
         containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)].forEach {
            $0.isActive = true
        }
        
    }
    
    private func categoryImageViewConstraints() {
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        [categoryImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
         categoryImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
         categoryImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
         categoryImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor)].forEach {
            $0.isActive = true
        }
    }
    
    private func categoryLabelConstraints() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        [categoryLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
         categoryLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -32)].forEach {
            $0.isActive = true
        }
    }
}

