//
//  ClothesProductTableViewController.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 13.02.23.
//

import UIKit

class ClothesTableViewController: UITableViewController {
    
    private let clothesViewModel: ClothesViewModel
    let clothes: Clothes
    
    init(clothesViewModel: ClothesViewModel, clothes: Clothes) {
        self.clothesViewModel = clothesViewModel
        self.clothes = clothes
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setClothesViewModel()
    }
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
    }
    
    private func setClothesViewModel() {
        clothesViewModel.onReciveDataCallBack = self.tableView.reloadData
        clothesViewModel.reciveMensClothesData()
    }
    
    private func setTableView() {
        tableView.register(ClothesProductTableViewCell.self, forCellReuseIdentifier: ClothesProductTableViewCell.reuseIdentifier)
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.rowHeight = 200
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClothesProductTableViewCell.reuseIdentifier) as? ClothesProductTableViewCell else { return UITableViewCell() }
        
       
        
        
        
        return cell
    }

}
