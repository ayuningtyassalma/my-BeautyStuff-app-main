//
//  BlushProductModel.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 04/05/23.
//

import Foundation

struct ProductModel: Codable {
    let id : Int
    let brand: String?
    let name: String
    let price: String?
    let price_sign: String?
    let currency: String?
    let description : String?
    let image_link: String?
    let product_colors : [Colors]?
    let product_api_url : String?
}

struct Colors : Codable{
    var hex_value : String
    var colour_name : String?
}


