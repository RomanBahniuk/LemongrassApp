//
//  ClothingCategoryTableViewCell.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 23.01.23.
//

import UIKit
import FirebaseStorage

class ClothingCategoryTableViewCell: UITableViewCell {
    
    
    static let reuseIdentifier = "ClothingCategoryTableViewCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
        self.separatorInset = .zero
        self.selectionStyle = .none
    }
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 16
        containerView.addSubview(clothingCategoryImageView)
        containerView.addSubview(categoryLabel)
        
        return containerView
    }()
    
    
    lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 24)
        categoryLabel.textColor = .black
        
        return categoryLabel
    }()
    
    
    lazy var clothingCategoryImageView: UIImageView = {
        let clothingCategoryImageView = UIImageView()
        clothingCategoryImageView.layer.cornerRadius = 16
        clothingCategoryImageView.clipsToBounds = true
        return clothingCategoryImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateValues(for typeOfClothing: TypeOfClothingSettable) {
        
        categoryLabel.text = typeOfClothing.clothesName
        
        let storageRef = Storage.storage().reference()
        let reference = storageRef.child(typeOfClothing.clothesImageURL)
        reference.getData(maxSize: 1 * 1024 * 1024) { data, err in
            if err != nil {
                print(err?.localizedDescription ?? "errror")
                
            } else {
                
                let image = UIImage(data: data!)
                self.clothingCategoryImageView.image = image
                
                reference.downloadURL { url, err in
                    if err != nil {
                        print(err?.localizedDescription ?? "err")
                        
                    } else {
                        print(url ?? "url")
                    }
                }
            }
        }
        
    }
    

}

private extension ClothingCategoryTableViewCell {
    func  addSubviews() {
        contentView.addSubview(containerView)
    }
    
    func setConstraints() {
        containerViewConstraints()
        clothingCategoryImageViewConstraints()
        categoryLabelConstraints()
    }
    
    func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
         containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor , constant: -8),
         containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
         containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)].forEach {
            $0.isActive = true
        }
    }
    
    func clothingCategoryImageViewConstraints() {
        clothingCategoryImageView.translatesAutoresizingMaskIntoConstraints = false
        [clothingCategoryImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
         clothingCategoryImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
         clothingCategoryImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor,multiplier: 0.3),
         clothingCategoryImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)].forEach {
            $0.isActive = true
        }
    }
    
    func categoryLabelConstraints() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        [categoryLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
         categoryLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)].forEach {
            $0.isActive = true
        }
    }
}
