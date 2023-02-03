//
//  ClothingCategoryViewModel.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 2.02.23.
//

import Foundation

protocol ClothingCategoryViewModelProtocol {
    
    var onReciveDataCallBack: (() -> Void)? { get set }
    var typeOfClothingModel: [TypeOfClothingModel] {get}
    func reciveMensClothesData()
    func reciveWomensClothesData()
    func numberOfRowsInSection(collectionType: TypeOfClothingModel, numberOfSection section: Int) -> Int
    func get(typeOfClothing: TypeOfClothingModel, numberOfSection IndexPath: IndexPath) -> TypeOfClothingSettable
    
    
}


final class ClothingCategoryViewModel: ClothingCategoryViewModelProtocol {
    
    private let firestoreService: FirestoreNetworkService
    var onReciveDataCallBack: (() -> Void)?
    var typeOfClothingModel: [TypeOfClothingModel] = []
    
    init(firestoreService: FirestoreNetworkService) {
        self.firestoreService = firestoreService
    }
    
    func numberOfRowsInSection(collectionType: TypeOfClothingModel, numberOfSection section: Int) -> Int {
        typeOfClothingModel.count
    }
    
    func get(typeOfClothing: TypeOfClothingModel, numberOfSection IndexPath: IndexPath) -> TypeOfClothingSettable {
        return typeOfClothingModel[IndexPath.row]
    }
    
    func reciveMensClothesData() {
        firestoreService.getMensClothingType { [weak self] mensTypeOfClothingData in
            self?.typeOfClothingModel = mensTypeOfClothingData
            self?.onReciveDataCallBack?()
            self?.typeOfClothingModel.sort {
                $0.clothesName < $1.clothesName
            }
            self?.onReciveDataCallBack?()
            
        }
    }
    
    func reciveWomensClothesData() {
        firestoreService.getWomensClothingType { [weak self] womensTypeOfClothingData in
            self?.typeOfClothingModel = womensTypeOfClothingData
            self?.typeOfClothingModel.sort {
                $0.clothesName < $1.clothesName
            }
            self?.onReciveDataCallBack?()
        }
    }
}
