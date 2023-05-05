//
//  BlushCategoryModel.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 04/05/23.
//

import Foundation

struct CategoryModel: Codable {
    let id : Int
    let brand: String?
    let name: String
    let price: String?
    let price_sign: String?
    let currency: String?
    let image_link: String
    let product_colors : [Colors]?
}

struct Colors : Codable{
    var hex_value : String
    var colour_name : String?
}


