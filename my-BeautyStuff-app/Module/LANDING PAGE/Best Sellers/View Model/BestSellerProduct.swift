//
//  BestSellerProduct.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 06/05/23.
//

import Foundation

class BestSellerProduct : ProductViewmodelProtocol{
    var bindTypeProduct: (([ProductModel]?) -> ())?
    var urlString: String
    private var apiService : ApiServiceProtocol?
    var data : [ProductModel]?
    
    init(url: String, apiService : ApiServiceProtocol){
        self.urlString = url
        self.apiService = apiService
        
        if let url = URL(string: url){
            self.apiService?.get(url: url)
        }
    }
    
    func fetchProductData() {
        self.apiService?.callApi(model: [ProductModel]?.self, completion: {response in
            switch response{
            case .success(let success):
                self.bindTypeProduct?(success)
            case .failure(let error):
                self.bindTypeProduct?(nil)
            }
            
        })
    }
    
    
}
