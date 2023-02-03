//
//  CollectionTypeFooterView.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 31.01.23.
//

import UIKit

class CollectionTypeFooterView: UIView {
    
    private var footerContainerViewLeftAnchor = NSLayoutConstraint()
    private var footerTitleLabelCenterXAnchor = NSLayoutConstraint()
    private var footerDashLabelCenterXAnchor = NSLayoutConstraint()
    private var footerDescriptionLabelLeftAnchor = NSLayoutConstraint()
    private var footerDescriptionLabelRightAnchor = NSLayoutConstraint()
    private var hideFooterViewButtonCenterXAnchor = NSLayoutConstraint()
    let colorsManager = ColorsManager.self
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(footerContainerView)
        setAllConstraints()
        footerViewTapGesture()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var footerTitleLabel: UILabel = {
        let footerTitleLabel = UILabel()
        footerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        footerTitleLabel.text = "LEMONGRASS"
        footerTitleLabel.textColor = colorsManager.lemongrassColor
        footerTitleLabel.alpha = 0
        footerTitleLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 24)
        
        return footerTitleLabel
    }()
    
    private lazy var footerDashLabel: UILabel = {
        let footerDashLabel = UILabel()
        footerDashLabel.translatesAutoresizingMaskIntoConstraints = false
        footerDashLabel.text = "-"
        footerDashLabel.textColor = colorsManager.lemongrassColor
        footerDashLabel.alpha = 0
        footerDashLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 48)
        
        return footerDashLabel
    }()
    
    private lazy var footerDescriptionLabel: UILabel = {
        let footerDescriptionLabel = UILabel()
        footerDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        footerDescriptionLabel.text = "молодой белорусский бренд одежды для женщин и мужчин в стилистической категории Business и Smart casual."
        footerDescriptionLabel.textColor = colorsManager.lemongrassColor
        footerDescriptionLabel.alpha = 0
        footerDescriptionLabel.font = UIFont(name: "AmericanTypewriter", size: 16)
        footerDescriptionLabel.numberOfLines = 3
        
        
        return footerDescriptionLabel
    }()
    
    private lazy var footerContainerView: UIView = {
        let footerContainerView = UIImageView()
        footerContainerView.translatesAutoresizingMaskIntoConstraints = false
        footerContainerView.isUserInteractionEnabled = true
        footerContainerView.backgroundColor = .white
        footerContainerView.layer.cornerRadius = 16
        footerContainerView.layer.shadowColor = colorsManager.lemongrassLightColor.cgColor
        footerContainerView.layer.shadowRadius = 1.5
        footerContainerView.layer.shadowOpacity = 0.5
        footerContainerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        footerContainerView.layer.masksToBounds = false
        
        footerContainerView.addSubview(footerTitleLabel)
        footerContainerView.addSubview(footerDashLabel)
        footerContainerView.addSubview(footerDescriptionLabel)
        footerContainerView.addSubview(hideFooterViewButton)
        return footerContainerView
        
    }()
    
    private lazy var hideFooterViewButton: UIButton = {
        let hideFooterViewButton = UIButton()
        hideFooterViewButton.translatesAutoresizingMaskIntoConstraints = false
        hideFooterViewButton.alpha = 0
        hideFooterViewButton.layer.cornerRadius = 8
        hideFooterViewButton.setTitle("Скрыть", for: .normal)
        hideFooterViewButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Medium", size: 14)
        hideFooterViewButton.setTitleColor(colorsManager.lemongrassColor, for: .normal)
        hideFooterViewButton.setTitleColor(colorsManager.lemongrassColor.withAlphaComponent(0.8), for: .highlighted)
        hideFooterViewButton.backgroundColor = colorsManager.lemongrassLightColor.withAlphaComponent(0.7)
        hideFooterViewButton.addTarget(self, action: #selector(hideFooterViewButtonTapped), for: .touchUpInside)
        
        return hideFooterViewButton
    }()
    
    public func showFooterView() {
        UIView.animate(withDuration: 0.4, delay: 1.6, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseOut) {
            self.footerContainerViewLeftAnchor.constant = 8
            self.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 1.2, delay: 1.8, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerTitleLabel.alpha = 1
            self.footerTitleLabelCenterXAnchor.constant = 0
            self.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 1.4, delay: 2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerDashLabel.alpha = 1
            self.footerDashLabelCenterXAnchor.constant = 0
            self.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 2.2, delay: 2.4, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerDescriptionLabel.alpha = 1
            self.footerDescriptionLabelLeftAnchor.constant = 18
            self.footerDescriptionLabelRightAnchor.constant = -18
            self.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 1.4, delay: 3.5, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.hideFooterViewButton.alpha = 1
            self.hideFooterViewButtonCenterXAnchor.constant = 0
            self.layoutIfNeeded()
            
        }
        
        
        
    }
    
    @objc func hideFooterViewButtonTapped(sender: UIButton) {
        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.hideFooterViewButtonCenterXAnchor.constant = -144
            self.hideFooterViewButton.alpha = 0
            self.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.4, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerDescriptionLabelLeftAnchor.constant = -18
            self.footerDescriptionLabelRightAnchor.constant = -18
            self.footerDescriptionLabel.alpha = 0
            self.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.6, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerDashLabelCenterXAnchor.constant = -144
            self.footerDashLabel.alpha = 0
            self.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.8, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerTitleLabelCenterXAnchor.constant = -144
            self.footerTitleLabel.alpha = 0
            self.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 0.2, delay: 1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseOut) {
            self.footerContainerViewLeftAnchor.constant = -364
            self.footerContainerView.layer.shadowColor = self.colorsManager.lemongrassColor.cgColor
            self.footerContainerView.layer.shadowRadius = 1.5
            self.footerContainerView.layer.shadowOpacity = 0.7
            self.footerContainerView.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.layoutIfNeeded()
        }
        
        
    }
    
    @objc func footerViewConerTapped() {
        UIView.animate(withDuration: 0.2, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseOut) {
            self.footerContainerViewLeftAnchor.constant = 8
            self.footerContainerView.layer.shadowColor = self.colorsManager.lemongrassLightColor.cgColor
            self.footerContainerView.layer.shadowRadius = 1.5
            self.footerContainerView.layer.shadowOpacity = 0.5
            self.footerContainerView.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerTitleLabel.alpha = 1
            self.footerTitleLabelCenterXAnchor.constant = 0
            self.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.4, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerDashLabel.alpha = 1
            self.footerDashLabelCenterXAnchor.constant = 0
            self.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.5, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.footerDescriptionLabel.alpha = 1
            self.footerDescriptionLabelLeftAnchor.constant = 18
            self.footerDescriptionLabelRightAnchor.constant = -18
            self.layoutIfNeeded()
            
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.6, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.2, options: .curveLinear) {
            self.hideFooterViewButton.alpha = 1
            self.hideFooterViewButtonCenterXAnchor.constant = 0
            self.layoutIfNeeded()
            
        }
    }
    
    private func footerViewTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(footerViewConerTapped))
        self.addGestureRecognizer(tapGesture)
    }
    
    private func setAllConstraints() {
        footerContainerView.widthAnchor.constraint(equalToConstant: 374).isActive = true
        footerContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        footerContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        footerContainerViewLeftAnchor = footerContainerView.leftAnchor.constraint(equalTo: self.leftAnchor ,constant: -374)
        
        footerTitleLabel.topAnchor.constraint(equalTo: footerContainerView.topAnchor, constant: 6).isActive = true
        footerTitleLabelCenterXAnchor = footerTitleLabel.centerXAnchor.constraint(equalTo: footerContainerView.centerXAnchor, constant: -144)
        
        
        footerDashLabel.topAnchor.constraint(equalTo: footerTitleLabel.topAnchor, constant: 0).isActive = true
        footerDashLabelCenterXAnchor = footerDashLabel.centerXAnchor.constraint(equalTo: footerContainerView.centerXAnchor, constant: -144)
        
        
        [footerDescriptionLabel.topAnchor.constraint(equalTo: footerDashLabel.topAnchor, constant: 24),
         footerDescriptionLabel.bottomAnchor.constraint(equalTo: footerContainerView.bottomAnchor, constant: -24)].forEach {
            $0.isActive = true
        }
        
        footerDescriptionLabelLeftAnchor = footerDescriptionLabel.leftAnchor.constraint(equalTo: footerContainerView.leftAnchor, constant: -18)
        footerDescriptionLabelRightAnchor = footerDescriptionLabel.rightAnchor.constraint(equalTo: footerContainerView.rightAnchor, constant: -18)
        
        hideFooterViewButtonCenterXAnchor = hideFooterViewButton.centerXAnchor.constraint(equalTo: footerContainerView.centerXAnchor, constant: -144)
        hideFooterViewButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        hideFooterViewButton.widthAnchor.constraint(equalToConstant: 72).isActive = true
        hideFooterViewButton.bottomAnchor.constraint(equalTo: footerContainerView.bottomAnchor,constant: -2).isActive = true
        
        NSLayoutConstraint.activate([footerContainerViewLeftAnchor, footerTitleLabelCenterXAnchor, footerDashLabelCenterXAnchor,footerDescriptionLabelLeftAnchor,footerDescriptionLabelRightAnchor, hideFooterViewButtonCenterXAnchor])

    }
    
    
    
}
