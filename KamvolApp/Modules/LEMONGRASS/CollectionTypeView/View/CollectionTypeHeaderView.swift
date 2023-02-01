//
//  CollectionTypeHeaderView.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 31.01.23.
//

import UIKit

class CollectionTypeHeaderView: UIView {
    
    let colorsManager = ColorsManager.self
    
    var collectionTypeImageHeight = NSLayoutConstraint()
    var collectionTypeImageBottom = NSLayoutConstraint()
    var containerViewHeight = NSLayoutConstraint()
    
    
    private lazy var collectionTypeImage: UIImageView = {
        let collectionTypeImage = UIImageView()
        collectionTypeImage.translatesAutoresizingMaskIntoConstraints = false
        collectionTypeImage.image = UIImage(named: "CollectionTypeHeader")
        collectionTypeImage.clipsToBounds = true
        collectionTypeImage.contentMode = .scaleAspectFill
        collectionTypeImage.addSubview(headerLabel)
        
        return collectionTypeImage
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(collectionTypeImage)
        
        return containerView
    }()
    
    lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = colorsManager.lemongrassColor
        headerLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 32)
        headerLabel.text = "LEMONGRASS"
        return headerLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        collectionTypeImageBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        collectionTypeImageHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        
    }
    
    private func setAllConstraints() {
        
        NSLayoutConstraint.activate([widthAnchor.constraint(equalTo: containerView.widthAnchor),
                                     heightAnchor.constraint(equalTo: containerView.heightAnchor),
                                     centerXAnchor.constraint(equalTo: containerView.centerXAnchor)])
        
        containerView.widthAnchor.constraint(equalTo: collectionTypeImage.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        containerViewHeight.isActive = true
        
        collectionTypeImageBottom = collectionTypeImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        collectionTypeImageBottom.isActive = true
        collectionTypeImageHeight = collectionTypeImage.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        collectionTypeImageHeight.isActive = true
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        [headerLabel.leftAnchor.constraint(equalTo: collectionTypeImage.leftAnchor,constant: 8),
         headerLabel.bottomAnchor.constraint(equalTo: collectionTypeImage.bottomAnchor, constant: 0)].forEach {
            $0.isActive = true
            
        }
    }
    
    
}
