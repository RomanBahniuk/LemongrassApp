//
//  ProductModel.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 11.01.23.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

protocol ProductSettable {
    var productName: String {get}
    var productSerialNo: String {get}
    var productDescription: String {get}
    var productComposition: String {get}
    var productSize: String {get}
    var productImageURL: String! {get}
    
}

enum WearCollectionType: String {
    case mensCollection = "Мужская коллекция"
    case womensCollection = "Женская коллекция"
}

enum WearCategory: String {
    case jacket = "Пиджаки"
    case suit = "Костюмы"
    case blouse = "Блузки"
    case trousers = "Брюки"
    case wamus = "Жакеты"
    case waistcoat = "Жилеты"
    case dress = "Платья"
    case shirt = "Рубашки"
    case sundress = "Cарафаны"
    case skirt = "Юбки"
    case shorts = "Шорты"
    case coat = "Пальто"
}

struct CompleteProduct {
    var collectionType: WearCollectionType
    var category: WearCategory
    var product: [Product]
}

struct Product: ProductSettable, Equatable {
    
    var productName: String
    var productSerialNo: String
    var productDescription: String
    var productComposition: String
    var productSize: String
    var productImageURL: String!
    
    init(productName: String = "", productSerialNo: String = "", productDescription: String = "", productComposition: String = "", productSize: String = "", prductImageURL: String = "") {
        self.productName = productName
        self.productSerialNo = productSerialNo
        self.productDescription = productDescription
        self.productComposition = productComposition
        self.productSize = productSize
        self.productImageURL = prductImageURL
    }
    
    
}


