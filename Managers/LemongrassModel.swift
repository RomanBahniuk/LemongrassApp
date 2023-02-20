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

//MARK: LemongrassClothesModel
protocol ClothesSettable {
    var clothesName: String {get}
    var clothesSerialNo: String {get}
    var clothesDescription: String {get}
    var clothesComposition: String {get}
    var clothesSize: String {get}
    var clothesImageURL: String {get}
    var clothingCategory: String {get}
}

struct Clothes: ClothesSettable {
    
    var clothesName: String
    var clothesSerialNo: String
    var clothesDescription: String
    var clothesComposition: String
    var clothesSize: String
    var clothesImageURL: String
    var clothingCategory: String
    
    init(clothesName: String = "", clothesSerialNo: String = "", clothesDescription: String = "", clothesComposition: String = "", clothesSize: String = "", clothesImageURL: String = "", clothingCategory: String = "") {
        self.clothesName = clothesName
        self.clothesSerialNo = clothesSerialNo
        self.clothesDescription = clothesDescription
        self.clothesComposition = clothesComposition
        self.clothesSize = clothesSize
        self.clothesImageURL = clothesImageURL
        self.clothingCategory = clothingCategory
    }
    
    
}

enum MensClothingCategory: String {
    case jacket = "Пиджаки"
    case suit = "Костюмы"
}

enum WomensClothingCategory: String {
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

enum ClothingCollectionType: String {
    case mensCollection = "Мужская коллекция"
    case womensCollection = "Женская коллекция"
}


