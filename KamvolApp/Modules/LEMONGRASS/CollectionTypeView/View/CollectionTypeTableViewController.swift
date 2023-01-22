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
    let collectionType: CollectionTypeModel
    let colorsManager = ColorsManager.self
    
    
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
        UIApplication.shared.statusBarUIView?.backgroundColor = .white
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionTypeViewModel()
        setTableView()
        setNavigationBar()
        view.backgroundColor = .white
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let safeTopArea: CGFloat = -128
        let offset = scrollView.contentOffset.y - safeTopArea
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    private func setCollectionTypeViewModel() {
        collectionTypeViewModel.onReciveDataCallBack = self.tableView.reloadData
        collectionTypeViewModel.reciveData()
    }
    
    private func setTableView() {
        tableView.register(CollectionTypeTableViewCell.self, forCellReuseIdentifier: CollectionTypeTableViewCell.reuseIdentifier)
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.rowHeight = 184
    }
    
    
    private func setNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        
        navigationController?.navigationBar.standardAppearance = appearance
        
        let titleView = UIView()
        titleView.frame = .init(x: 0, y: 0, width: 350, height: 60)
        titleView.backgroundColor = .white
        titleView.addSubview(lemongrassLabel)
        navigationItem.titleView = titleView
    }
    
    private lazy var lemongrassLabel: UILabel = {
        let lemongrassLabel = UILabel()
        lemongrassLabel.text = "LEMONGRASS"
        lemongrassLabel.textColor = colorsManager.lemongrassColor
        lemongrassLabel.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 32)
        lemongrassLabel.frame = .init(x: 73, y: 8, width: 204, height: 32)
        
        
        return lemongrassLabel
        
    }()
    
    
    
    
    
    //MARK: DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        collectionTypeViewModel.numberOfRowsInSection(collectionType: collectionType, numberOfSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTypeTableViewCell.reuseIdentifier) as? CollectionTypeTableViewCell else { return UITableViewCell() }
        cell.updateValues(for: collectionTypeViewModel.get(collectionType: collectionType, numberOfSection: indexPath))
        return cell
    }
    
    
    
}

