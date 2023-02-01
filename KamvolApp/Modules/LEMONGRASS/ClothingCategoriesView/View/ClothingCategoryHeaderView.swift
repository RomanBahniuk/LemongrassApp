//
//  ClothingCategoryHeaderView.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 28.01.23.
//

import UIKit

class ClothingCategoryHeaderView: UIView {
    
    var clothingCategoryImageHeight = NSLayoutConstraint()
    var clothingCategoryImageBottom = NSLayoutConstraint()
    var containerViewHeight = NSLayoutConstraint()
    
    
    
    private lazy var clothingCategoryImage: UIImageView = {
       let clothingCategoryImage = UIImageView()
        clothingCategoryImage.translatesAutoresizingMaskIntoConstraints = false
        clothingCategoryImage.image = UIImage(named: "01CategoryTitle")
        clothingCategoryImage.clipsToBounds = true
        clothingCategoryImage.contentMode = .scaleAspectFill
        clothingCategoryImage.addSubview(headerLabel)
        
        return clothingCategoryImage
    }()
    
    
    private lazy var containerView: UIView = {
       let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(clothingCategoryImage)
        
        return containerView
    }()
    
    
    lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .white
        headerLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 32)
        headerLabel.text = "Мужская коллекция"
        return headerLabel
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(containerView)
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        clothingCategoryImageBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        clothingCategoryImageHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        
    }
    
    
    private func setAllConstraints() {
        NSLayoutConstraint.activate([widthAnchor.constraint(equalTo: containerView.widthAnchor),
        heightAnchor.constraint(equalTo: containerView.heightAnchor),
        centerXAnchor.constraint(equalTo: containerView.centerXAnchor)])
        
        containerView.widthAnchor.constraint(equalTo: clothingCategoryImage.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        containerViewHeight.isActive = true
        
        clothingCategoryImageBottom = clothingCategoryImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        clothingCategoryImageBottom.isActive = true
        clothingCategoryImageHeight = clothingCategoryImage.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        clothingCategoryImageHeight.isActive = true
        
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        [headerLabel.leftAnchor.constraint(equalTo: clothingCategoryImage.leftAnchor,constant: 16),
         headerLabel.bottomAnchor.constraint(equalTo: clothingCategoryImage.bottomAnchor, constant: 0)].forEach {
            $0.isActive = true
        }
        
        
        
        
    }
    
    
    

}
