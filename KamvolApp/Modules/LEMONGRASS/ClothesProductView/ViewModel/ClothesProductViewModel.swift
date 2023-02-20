//
//  ClothesProductViewModel.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 13.02.23.
//

import Foundation

protocol ClothesViewModelProtocol {
    
    var onReciveDataCallBack: (() -> Void)? { get set }
    var clothesModel: [Clothes] {get}
    func reciveMensClothesData()
    func numberOfRowsInSection(clothesType: Clothes, numberOfSection section: Int) -> Int
    func get(clothes: Clothes, numberOfSection IndexPath: IndexPath) -> ClothesSettable
    
    
}


final class ClothesViewModel: ClothesViewModelProtocol {
    
    
    private let firestoreService: FirestoreNetworkService
    var onReciveDataCallBack: (() -> Void)?
    var clothesModel: [Clothes] = []
    
    init(firestoreService: FirestoreNetworkService) {
        self.firestoreService = firestoreService
    }
    
    func numberOfRowsInSection(clothesType: Clothes, numberOfSection section: Int) -> Int {
        clothesModel.count
    }
    
    func get(clothes: Clothes, numberOfSection IndexPath: IndexPath) -> ClothesSettable {
        return clothesModel[IndexPath.row]
    }
    
    func reciveMensClothesData() {
    }
}

