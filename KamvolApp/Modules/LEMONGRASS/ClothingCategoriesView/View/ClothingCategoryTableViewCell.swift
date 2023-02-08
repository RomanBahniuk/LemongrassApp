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
    let colorsManager = ColorsManager.self
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .systemGray6
        self.separatorInset = .zero
        self.selectionStyle = .none
    }
    
    private lazy var containerView: UIView = {
       let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.shadowColor = colorsManager.lemongrassLightColor.cgColor
        containerView.layer.shadowRadius = 1.5
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        containerView.layer.masksToBounds = false
        
        
        return containerView
    }()
    
    
    private lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 24)
        categoryLabel.textColor = .black
        
        return categoryLabel
    }()
    
    
    private lazy var clothingCategoryImageView: UIImageView = {
        let clothingCategoryImageView = UIImageView()
        //clothingCategoryImageView.layer.cornerRadius = 40
        clothingCategoryImageView.clipsToBounds = true
        clothingCategoryImageView.backgroundColor = .systemGray6
        
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
//        reference.getData(maxSize: 1 * 2048 * 2048) { data, err in
//            if err != nil {
//                print(err?.localizedDescription ?? "errror")
//
//            } else {
//
//                let image = UIImage(data: data!)
//                self.clothingCategoryImageView.image = image
//
//                reference.downloadURL { url, err in
//                    if err != nil {
//                        print(err?.localizedDescription ?? "err")
//
//                    } else {
//                        print(url ?? "url")
//                    }
//                }
//            }
//        }
    }
    

}

private extension ClothingCategoryTableViewCell {
    func  addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(clothingCategoryImageView)
        containerView.addSubview(categoryLabel)
    }
    
    func setConstraints() {
        containerViewConstraints()
        clothingCategoryImageViewConstraints()
        categoryLabelConstraints()
    }
    
    func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
         containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
         containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16),
         containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -16)].forEach {
            $0.isActive = true
        }
    }
    
    func clothingCategoryImageViewConstraints() {
        clothingCategoryImageView.translatesAutoresizingMaskIntoConstraints = false
        [clothingCategoryImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
         clothingCategoryImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
         clothingCategoryImageView.widthAnchor.constraint(equalToConstant: 64),
         clothingCategoryImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)].forEach {
            $0.isActive = true
        }
    }
    
    func categoryLabelConstraints() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        [categoryLabel.centerYAnchor.constraint(equalTo: clothingCategoryImageView.centerYAnchor),
         categoryLabel.leftAnchor.constraint(equalTo: clothingCategoryImageView.rightAnchor, constant: 24)].forEach {
            $0.isActive = true
        }
    }
}
