//
//  ClothesProductTableViewCell.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 13.02.23.
//

import UIKit
import FirebaseStorage
import FirebaseStorageUI

class ClothesProductTableViewCell: UITableViewCell {
    
    
    static let reuseIdentifier = "ClothesProductTableViewCell"
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.addSubview(clothesProductImageView)
        
        return containerView
    }()
    
    private lazy var clothesProductImageView: UIImageView = {
        let clothesProductImageView = UIImageView()
        clothesProductImageView.clipsToBounds = true
        clothesProductImageView.contentMode = .scaleAspectFill
        clothesProductImageView.addSubview(clothesProductName)
        clothesProductImageView.addSubview(clothesProductDescription)
        
        return clothesProductImageView
    }()
    
    private lazy var clothesProductName: UILabel = {
        let clothesProductName = UILabel()
        clothesProductName.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 24)
        clothesProductName.textColor = .black
        
        
        return clothesProductName
    }()
    
    private lazy var clothesProductDescription: UILabel = {
        let clothesProductDescription = UILabel()
        
        
        return clothesProductDescription
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
    
    func updateValues(for clothesCell: ClothesSettable) {
        
        clothesProductName.text = clothesCell.clothesName
        
        let storageRef = Storage.storage().reference()
        let reference = storageRef.child(clothesCell.clothesImageURL)
        self.clothesProductImageView.sd_setImage(with: reference)
    }
    
    
}


private extension ClothesProductTableViewCell {
    
    private func addSubviews() {
        contentView.addSubview(containerView)
    }
    
    private func setConstraints() {
        containerViewConstraints()
        clothesProductImageViewConstraints()
        clothesProductNameConstraints()
        clothesProductDescriptionConstraints()
    }
    
    private func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -16).isActive = true
        containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16).isActive = true
    }
    
    private func clothesProductImageViewConstraints() {
        clothesProductImageView.translatesAutoresizingMaskIntoConstraints = false
        clothesProductImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        clothesProductImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        clothesProductImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        clothesProductImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
    }
    
    private func clothesProductNameConstraints() {
        clothesProductName.translatesAutoresizingMaskIntoConstraints = false
        clothesProductName.leftAnchor.constraint(equalTo: clothesProductImageView.leftAnchor, constant: 32).isActive = true
        clothesProductName.bottomAnchor.constraint(equalTo: clothesProductImageView.bottomAnchor, constant: -16).isActive = true
    }
    
    private func clothesProductDescriptionConstraints() {
        clothesProductDescription.translatesAutoresizingMaskIntoConstraints = false
    }
}
