//
//  LemongrassCollectionTypeModel.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 18.01.23.
//

import Foundation

protocol CollectionTypeSettable {
    var wearCollectionTypeName: String {get}
    var wearCollectionTypeImageURL: String {get}
}

struct CollectionTypeModel: CollectionTypeSettable {
    
    var wearCollectionTypeName: String
    var wearCollectionTypeImageURL: String
    
    
    init(wearCollectionTypeName: String = "", wearCollectionTypeImageURL: String = "") {
        self.wearCollectionTypeName = wearCollectionTypeName
        self.wearCollectionTypeImageURL = wearCollectionTypeImageURL
    }
}


