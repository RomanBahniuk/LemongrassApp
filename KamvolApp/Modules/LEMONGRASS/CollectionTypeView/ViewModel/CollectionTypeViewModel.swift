//
//  LemongrassViewModel.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 18.01.23.
//

import Foundation
 
protocol CollectionTypeViewModelProtocol {
    var onReciveDataCallBack: (() -> Void)? { get set }
    var collectionTypeModel: [CollectionTypeModel] {get}
    func reciveData()
    func numberOfRowsInSection(collectionType: CollectionTypeModel, numberOfSection section: Int) -> Int
    func get(collectionType: CollectionTypeModel, numberOfSection IndexPath: IndexPath) -> CollectionTypeSettable

    
}

final class CollectionTypeViewModel: CollectionTypeViewModelProtocol {
    
    
    
    
    private let firestoreService: FirestoreNetworkService
    var onReciveDataCallBack: (() -> Void)?
    var collectionTypeModel: [CollectionTypeModel] = []
    
    init(firestoreService: FirestoreNetworkService) {
        self.firestoreService = firestoreService
    }
    
    func numberOfRowsInSection(collectionType: CollectionTypeModel, numberOfSection section: Int) -> Int {
        collectionTypeModel.count
    }
    
    func get(collectionType: CollectionTypeModel, numberOfSection indexPath: IndexPath) -> CollectionTypeSettable {
        return collectionTypeModel[indexPath.row]
        
    }
    
    func reciveData() {
        firestoreService.getCategoryType { [weak self] collectionTypeData in
            self?.collectionTypeModel = collectionTypeData
            self?.onReciveDataCallBack?()
        }
    }
    
    
}




