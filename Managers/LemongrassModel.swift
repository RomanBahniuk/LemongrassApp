//
//  LemongrassModel.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 3.02.23.
//

import Foundation

//MARK: CollectionTypeModel
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


//MARK: LemongrassTypeOfClothingModel
protocol TypeOfClothingSettable {
    var clothesName: String { get }
    var clothesImageURL: String { get }
}


struct TypeOfClothingModel: TypeOfClothingSettable {
    
    var clothesName: String
    var clothesImageURL: String
    
    init(clothesName: String = "", clothesImageURL: String = "") {
        self.clothesName = clothesName
        self.clothesImageURL = clothesImageURL
    }
    
}

enum ClothingCollectionType: String {
    case mensCollection = "Мужская коллекция"
    case womensCollection = "Женская коллекция"
}

//MARK: LemongrassProductModel
protocol ProductSettable {
    var productName: String {get}
    var productSerialNo: String {get}
    var productDescription: String {get}
    var productComposition: String {get}
    var productSize: String {get}
    var productImageURL: String {get}
    
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
    var collectionType: ClothingCollectionType
    var category: WearCategory
    var product: [Product]
}

struct Product: ProductSettable, Equatable {
    
    var productName: String
    var productSerialNo: String
    var productDescription: String
    var productComposition: String
    var productSize: String
    var productImageURL: String
    
    init(productName: String = "", productSerialNo: String = "", productDescription: String = "", productComposition: String = "", productSize: String = "", prductImageURL: String = "") {
        self.productName = productName
        self.productSerialNo = productSerialNo
        self.productDescription = productDescription
        self.productComposition = productComposition
        self.productSize = productSize
        self.productImageURL = prductImageURL
    }
    
    
}
