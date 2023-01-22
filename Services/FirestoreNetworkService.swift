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
    
    
}

