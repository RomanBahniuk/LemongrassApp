//
//  MensClothingModel.swift
//  KamvolApp
//
//  Created by Роман Багнюк on 19.02.23.
//

import Foundation


struct Jacket {
    var name: String
    var imageURL: String
    
    init(name: String = "" , imageURL: String = "") {
        self.name = name
        self.imageURL = imageURL
    }
}

struct Suit {
    var name: String
    var imageURL: String
    
    init(name: String = "" , imageURL: String = "") {
        self.name = name
        self.imageURL = imageURL
    }
}

struct MensClothing {
    var jacket: [Jacket]
    var suit: [Suit]
    init(jacket: [Jacket], suit: [Suit]) {
        self.jacket = jacket
        self.suit = suit
    }
}

struct mensClothingCollection {
    var mensClothing: [MensClothing]
    
    init(mensClothing: [MensClothing]) {
        self.mensClothing = mensClothing
    }
}
