//
//  Hero.swift
//  HeroApp
//
//  Created by Sevda Gul Baran on 6.09.2022.
//

import Foundation

struct Hero: Decodable{
    var localizedName: String?
    var img: String?
    
    enum CodingKeys: String, CodingKey {
        case localizedName = "localized_name"
        case img = "img"
    }
}
