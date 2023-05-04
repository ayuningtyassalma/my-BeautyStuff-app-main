//
//  BlushCategoryModel.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 04/05/23.
//

import Foundation

struct CategoryProduct: Codable {
    var brand : String
    var name : String
    var prie : String
    var price_sign : String
    var currency : String
    var image_link : String
    var description : String
    var rating : Int
    var product_type : String
    var tag_list : [String]
    var product_colors : [Colors]
}

struct Colors : Codable{
    var hex_value : String
    var colour_name : String
}


