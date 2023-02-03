//
//  ClothingCategoryTableViewController.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 23.01.23.
//

import UIKit

class ClothingCategoryTableViewController: UITableViewController, UIGestureRecognizerDelegate {
    
    private let clothingCategoryViewModel: ClothingCategoryViewModel
    let typeOfClothingModel: TypeOfClothingModel
    var topContentOffset: CGFloat = 65
    var bottomContentOffset: CGFloat = -235

    init(clothingCategoryViewModel:ClothingCategoryViewModel, typeOfClothingModel: TypeOfClothingModel) {
        self.clothingCategoryViewModel = clothingCategoryViewModel
        self.typeOfClothingModel = typeOfClothingModel
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarUIView?.backgroundColor = .clear
        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setTypeOfClothingViewModel()
        
    }
    
    override func loadView() {
        super.loadView()
        setBackButtonItem()
        setHeaderView()
        scrollToBottomGesture()
        navigationController?.navigationBar.backgroundColor = .clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarUIView?.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .clear
        
    }
    
    private lazy var backButtonItem: UIButton = {
        let backButtonItem = UIButton()
        backButtonItem.layer.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        backButtonItem.layer.cornerRadius = backButtonItem.frame.height / 2
        backButtonItem.alpha = 1
        backButtonItem.backgroundColor = .white.withAlphaComponent(0.9)
        backButtonItem.setImage(UIImage(named: "BackButton"), for: .normal)
        backButtonItem.tintColor = .black
        backButtonItem.addTarget(self, action: #selector(popToViewController), for: .touchUpInside)
        
        
        return backButtonItem
    }()
    
    
    private lazy var navBarLabel: UILabel = {
       let navBarLabel = UILabel()
        navBarLabel.layer.frame = CGRect(x: 104, y: 10, width: 168, height: 40)
        navBarLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 18)
        navBarLabel.textColor = .black
        navBarLabel.alpha = 0
        navBarLabel.isUserInteractionEnabled = true
        return navBarLabel
        
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 440, height: 40)))
        containerView.backgroundColor = .clear
        containerView.addSubview(backButtonItem)
        containerView.addSubview(navBarLabel)
       return containerView
    }()
    
    private func setTypeOfClothingViewModel() {
        clothingCategoryViewModel.onReciveDataCallBack = self.tableView.reloadData
    }
    
    private func setTableView() {
        tableView.register(ClothingCategoryTableViewCell.self, forCellReuseIdentifier: ClothingCategoryTableViewCell.reuseIdentifier)
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.rowHeight = 120
        
    }
    
    func prepareForePresentMensTypeOfClothing() {
        guard let header = self.tableView.tableHeaderView as? ClothingCategoryHeaderView else { return }
        header.updateHeaderLabel(text: "Мужская коллекция", image: UIImage(named: "01CategoryTitle")!)
        clothingCategoryViewModel.reciveMensClothesData()
        navBarLabel.text = "Мужская коллекция"
    }
    
    func prepareForePresentWomensTypeOfClothing() {
        guard let header = self.tableView.tableHeaderView as? ClothingCategoryHeaderView else { return }
        clothingCategoryViewModel.reciveWomensClothesData()
        navBarLabel.text = "Женская коллекция"
        header.updateHeaderLabel(text: "Женская коллекция", image: UIImage(named: "02CategoryTitle")!)
    }
    
    private func setBackButtonItem() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: containerView)
        
    }
    
    private func setHeaderView() {
        let header = ClothingCategoryHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 160))
        self.tableView.tableHeaderView = header
        
    }
    
    private func scrollToBottomGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navBarLabelTapped))
        navBarLabel.addGestureRecognizer(tapGesture)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        guard let header = self.tableView.tableHeaderView as? ClothingCategoryHeaderView else { return }
        header.scrollViewDidScroll(scrollView: self.tableView)
        header.headerLabel.alpha = 1 - ((scrollView.contentOffset.y + self.topContentOffset) / self.topContentOffset)
        
        if(self.topContentOffset > scrollView.contentOffset.y) {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: .curveLinear) {
                self.navBarLabel.alpha = 0
                self.navBarLabel.frame.origin.y = 10
                self.backButtonItem.backgroundColor = .white.withAlphaComponent(0.8)
                self.backButtonItem.frame.origin.x = 0
                self.navigationController?.navigationBar.backgroundColor = .clear
                UIApplication.shared.statusBarUIView?.backgroundColor = .clear
                
                
            }
        } else if (self.topContentOffset < scrollView.contentOffset.y) {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: .curveLinear) {
                self.navBarLabel.alpha = 1
                self.navBarLabel.frame.origin.y = 0
                self.backButtonItem.backgroundColor = .white.withAlphaComponent(0)
                self.backButtonItem.frame.origin.x = -10
                self.navigationController?.navigationBar.backgroundColor = .white
                UIApplication.shared.statusBarUIView?.backgroundColor = .white
            }

        }
        
        if (bottomContentOffset >= scrollView.contentOffset.y) {
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: .curveLinear) {
                self.backButtonItem.alpha = 0

                
            }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: .curveLinear) {
                self.backButtonItem.alpha = 1
                


            }
        }
        
    }
    
    @objc func popToViewController(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func navBarLabelTapped() {
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clothingCategoryViewModel.numberOfRowsInSection(collectionType: typeOfClothingModel, numberOfSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClothingCategoryTableViewCell.reuseIdentifier) as? ClothingCategoryTableViewCell else { return UITableViewCell() }
        cell.updateValues(for: clothingCategoryViewModel.get(typeOfClothing: typeOfClothingModel, numberOfSection: indexPath))
        
        return cell
    }

}
