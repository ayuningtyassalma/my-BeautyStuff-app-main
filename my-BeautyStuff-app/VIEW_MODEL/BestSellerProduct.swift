//
//  BestSellerProduct.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 06/05/23.
//

import Foundation

protocol BestSellerProductProtocol{
    var url : String {get}
    var bindBestSellerProduct : (([CategoryModel]?)->())? {get set}
    func fetchDataBestSeller()
}

class BestSellerProduct : BestSellerProductProtocol{

    var url: String = ""
    private var apiService : ApiServiceProtocol?
    var bindBestSellerProduct: (([CategoryModel]?) -> ())?
    var data : [CategoryModel]?
    
    init(url: String, apiService : ApiServiceProtocol){
        self.url = url
        self.apiService = apiService
        
        if let url = URL(string: url){
            self.apiService?.get(url: url)
        }
    }
    
    func fetchDataBestSeller() {
        self.apiService?.callApi(model: [CategoryModel]?.self, completion: {response in
            switch response{
            case .success(let success):
                self.bindBestSellerProduct?(success)
            case .failure(let error):
                self.bindBestSellerProduct?(nil)
            }
            
        })
    }
    
    
}
