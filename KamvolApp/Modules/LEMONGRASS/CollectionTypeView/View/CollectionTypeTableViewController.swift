//
//  CollectionTypeTableViewController.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 10.01.23.
//

import UIKit
import FirebaseFirestore

final class CollectionTypeTableViewController: UITableViewController {
    
    private let collectionTypeViewModel: CollectionTypeViewModel
    let footerView = CollectionTypeFooterView()
    let collectionType: CollectionTypeModel
    let colorsManager = ColorsManager.self
    var topContentOffset: CGFloat = 68.5
    
    init(collectionType: CollectionTypeViewModel, collection: CollectionTypeModel) {
        self.collectionTypeViewModel = collectionType
        self.collectionType = collection
        super.init(style: .grouped)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarUIView?.backgroundColor = .clear
        setCollectionTypeViewModel()

        
    }
    
    override func loadView() {
        super.loadView()
        setHeaderView()
        footerView.showFooterView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setNavigationBar()
        
    }
    
    private lazy var navBarLabel: UILabel = {
        let navBarLabel = UILabel()
        navBarLabel.layer.frame = CGRect(x: 128, y: 10, width: 168, height: 40)
        navBarLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 18)
        navBarLabel.textColor = colorsManager.lemongrassColor
        navBarLabel.alpha = 0
        navBarLabel.text = "LEMONGRASS"
        return navBarLabel
        
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 440, height: 40)))
        containerView.backgroundColor = .clear
        containerView.addSubview(navBarLabel)
        return containerView
    }()
    
    private func setCollectionTypeViewModel() {
        collectionTypeViewModel.onReciveDataCallBack = self.tableView.reloadData
        collectionTypeViewModel.reciveData()
    }
    
    private func setTableView() {
        tableView.register(CollectionTypeTableViewCell.self, forCellReuseIdentifier: CollectionTypeTableViewCell.reuseIdentifier)
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.rowHeight = 176
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -60, right: 0)
        
    }
    
    
    private func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationItem.titleView = containerView
    }
    
    private func setHeaderView() {
        let header = CollectionTypeHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 160))
        self.tableView.tableHeaderView = header
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        guard let header = self.tableView.tableHeaderView as? CollectionTypeHeaderView else { return }
        header.scrollViewDidScroll(scrollView: self.tableView)
        header.headerLabel.alpha = 1 - ((scrollView.contentOffset.y + self.topContentOffset) / self.topContentOffset)
        
        
        
        if topContentOffset < scrollView.contentOffset.y {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: .curveLinear) {
                self.navBarLabel.alpha = 1
                self.navBarLabel.frame.origin.y = 0
                self.navigationController?.navigationBar.backgroundColor = .systemGray6
                UIApplication.shared.statusBarUIView?.backgroundColor = .systemGray6
            }
            
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: .curveLinear) {
                self.navBarLabel.alpha = 0
                self.navBarLabel.frame.origin.y = 10
                self.navigationController?.navigationBar.backgroundColor = .clear
                UIApplication.shared.statusBarUIView?.backgroundColor = .clear
            }
            
        }
        
    }
    
    
    
    
    
    //MARK: DataSource
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = footerView
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 138
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        collectionTypeViewModel.numberOfRowsInSection(collectionType: collectionType, numberOfSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTypeTableViewCell.reuseIdentifier) as? CollectionTypeTableViewCell else { return UITableViewCell() }
        cell.updateValues(for: collectionTypeViewModel.get(collectionType: collectionType, numberOfSection: indexPath))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: let controller = ClothingCategoryTableViewController()
            controller.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(controller, animated: true)
            
            
        default: break
        }
    }
    
    
    
}

