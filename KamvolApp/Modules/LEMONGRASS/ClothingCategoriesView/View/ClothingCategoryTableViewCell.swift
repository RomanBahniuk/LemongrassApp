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
    
    
    lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 24)
        categoryLabel.textColor = .black
        
        return categoryLabel
    }()
    
    
    lazy var clothingCategoryImageView: UIImageView = {
        let clothingCategoryImageView = UIImageView()
        clothingCategoryImageView.layer.cornerRadius = 40
        clothingCategoryImageView.clipsToBounds = true
        clothingCategoryImageView.backgroundColor = .white.withAlphaComponent(0.9)
        clothingCategoryImageView.layer.shadowColor = colorsManager.lemongrassLightColor.cgColor
        clothingCategoryImageView.layer.shadowRadius = 1.5
        clothingCategoryImageView.layer.shadowOpacity = 0.5
        clothingCategoryImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        clothingCategoryImageView.layer.masksToBounds = false
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
        reference.getData(maxSize: 1 * 2048 * 2048) { data, err in
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
        contentView.addSubview(clothingCategoryImageView)
        contentView.addSubview(categoryLabel)
    }
    
    func setConstraints() {
        clothingCategoryImageViewConstraints()
        categoryLabelConstraints()
    }
    
    func clothingCategoryImageViewConstraints() {
        clothingCategoryImageView.translatesAutoresizingMaskIntoConstraints = false
        [clothingCategoryImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
         clothingCategoryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         clothingCategoryImageView.widthAnchor.constraint(equalToConstant: 80),
         clothingCategoryImageView.heightAnchor.constraint(equalToConstant: 80)].forEach {
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
