//
//  ClothingCategoryHeaderView.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 28.01.23.
//

import UIKit

class ClothingCategoriesHeaderView: UIView {
    
    let colorsManager = ColorsManager.self
    var clothingCategoryImageHeight = NSLayoutConstraint()
    var clothingCategoryImageBottom = NSLayoutConstraint()
    var containerViewHeight = NSLayoutConstraint()
    
    private lazy var clothingCategoryImage: UIImageView = {
       let clothingCategoryImage = UIImageView()
        clothingCategoryImage.translatesAutoresizingMaskIntoConstraints = false
        clothingCategoryImage.clipsToBounds = true
        clothingCategoryImage.contentMode = .scaleAspectFill
        clothingCategoryImage.addSubview(headerLabel)
        
        return clothingCategoryImage
    }()
    
    lazy var blurView: UIVisualEffectView = {
       let blurView = UIVisualEffectView()
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.clipsToBounds = true
        blurView.effect = UIBlurEffect(style: .prominent)
        
        return blurView
    }()
    
    
    private lazy var containerView: UIView = {
       let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(clothingCategoryImage)
        containerView.addSubview(blurView)
        
        return containerView
    }()
    
    
    lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 32)
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
    
    func updateHeaderLabel(text: String, textColor: UIColor, image: UIImage) {
        headerLabel.text = text
        headerLabel.textColor = textColor
        clothingCategoryImage.image = image
        
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
        
        
        [headerLabel.leftAnchor.constraint(equalTo: clothingCategoryImage.leftAnchor,constant: 16),
         headerLabel.bottomAnchor.constraint(equalTo: clothingCategoryImage.bottomAnchor, constant: 0)].forEach {
            $0.isActive = true
        }
        
        [blurView.centerXAnchor.constraint(equalTo: clothingCategoryImage.centerXAnchor),
         blurView.centerYAnchor.constraint(equalTo: clothingCategoryImage.centerYAnchor),
         blurView.widthAnchor.constraint(equalTo: clothingCategoryImage.widthAnchor),
         blurView.heightAnchor.constraint(equalTo: clothingCategoryImage.heightAnchor)].forEach {
            $0.isActive = true
        }
        
        
        
        
    }
    
    
    

}
