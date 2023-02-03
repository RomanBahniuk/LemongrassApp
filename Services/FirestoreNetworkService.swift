//
//  FirestoreNetworkService.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 15.01.23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

protocol FirestoreNetworkServiceCollectionSettable {
    func getCategoryType(completion: @escaping ([CollectionTypeModel]) -> Void)
    func getMensClothingType(completion: @escaping ([TypeOfClothingModel]) -> Void)
    func getWomensClothingType(completion: @escaping ([TypeOfClothingModel]) -> Void)

}

final class FirestoreNetworkService: FirestoreNetworkServiceCollectionSettable {

    let queue = DispatchQueue(label: "com.KamvolApp.FirestoreNetworkService", qos: .background)
    
    func getCategoryType(completion: @escaping ([CollectionTypeModel]) -> Void) {
        let db = Firestore.firestore()
        queue.async {
            db.collection("CollectionType").getDocuments { snap, err in
                if let err = err {
                    print(err)
                } else {
                    guard let snap = snap else { return }
                    var collectionTypeData: [CollectionTypeModel] = []
                    for document in snap.documents {
                        let collectionTypeName = document.get("wearCollectionTypeName") as? String ?? ""
                        let collectionImageURL = document.get("wearCollectionTypeImageURL") as? String ?? ""
                        
                        let completeCollectionType = CollectionTypeModel(
                            wearCollectionTypeName: collectionTypeName,
                            wearCollectionTypeImageURL: collectionImageURL)
                        
                        collectionTypeData.append(completeCollectionType)
                    }
                    completion(collectionTypeData)
                }
                
            }
        }
        
    }
    
    
    func getMensClothingType(completion: @escaping ([TypeOfClothingModel]) -> Void) {
        let db = Firestore.firestore()
        queue.async {
            db.collection("TypeOfClothing/MensTypeOfClothing/Clothes").getDocuments { snap, err in
                if let err = err {
                    print(err)
                } else {
                    guard let snap = snap else { return }
                    var mensTypeOfClothingData: [TypeOfClothingModel] = []
                    for document in snap.documents {
                        let clothesName = document.get("clothesName") as? String ?? ""
                        let clothesImageURL = document.get("clothesImageURL") as? String ?? ""
                        
                        let completeMensTypeOfClothingData = TypeOfClothingModel(clothesName: clothesName, clothesImageURL: clothesImageURL)
                        
                        mensTypeOfClothingData.append(completeMensTypeOfClothingData)
                    }
                    completion(mensTypeOfClothingData)
                }
            }
        }
    }
    
    
    
    func getWomensClothingType(completion: @escaping ([TypeOfClothingModel]) -> Void) {
        let db = Firestore.firestore()
        queue.async {
            db.collection("TypeOfClothing/WomensTypeOfClothing/Clothes").getDocuments { snap, err in
                if let err = err {
                    print(err)
                } else {
                    guard let snap = snap else { return }
                    var mensTypeOfClothingData: [TypeOfClothingModel] = []
                    for document in snap.documents {
                        let clothesName = document.get("clothesName") as? String ?? ""
                        let clothesImageURL = document.get("clothesImageURL") as? String ?? ""
                        
                        let completeMensTypeOfClothingData = TypeOfClothingModel(clothesName: clothesName, clothesImageURL: clothesImageURL)
                        
                        mensTypeOfClothingData.append(completeMensTypeOfClothingData)
                    }
                    completion(mensTypeOfClothingData)
                }
            }
        }
    }
    
    
}

