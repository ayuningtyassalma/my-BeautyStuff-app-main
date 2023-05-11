//
//  ProductCategoriViewModel.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 04/05/23.
//

import Foundation

protocol ProductViewmodelProtocol {
    var urlString : String {get}
    var bindTypeProduct : (([ProductModel]?)-> ())? {get set}
    func fetchProductData()
}

class ProductCategoryViewModel : ProductViewmodelProtocol {
    private var apiService : ApiServiceProtocol?
    var urlString: String
    var bindTypeProduct: (([ProductModel]?) -> ())?
    var data : [ProductModel]?
    
    init(urlString: String, apiService:ApiServiceProtocol){
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString){
            self.apiService?.get(url: url)
        }
//        fetchDataCategory()
    }
    
    func fetchProductData() {
        self.apiService?.callApi(model: [ProductModel]?.self, completion: { response in
            switch response {
            case .success (let success):
                print("success result \(success)")
                self.bindTypeProduct?(success)
            case .failure (let error):
                print("error: \(error)")
                self.bindTypeProduct?(nil)
            }
            
        })
    }
    
    
    
    
}
