//
//  ProductCategoriViewModel.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 04/05/23.
//

import Foundation

protocol ProductCategoryViewModelProtocol {
    var urlString : String {get}
    var bindTypeProductCategory : ((CategoryProduct?)-> ())? {get set}
    func fetchDataCategory()
}

class ProductCategoryViewModel : ProductCategoryViewModelProtocol {
    private var apiService : ApiServiceProtocol?
    var urlString: String
    var bindTypeProductCategory: ((CategoryProduct?) -> ())?
    var data : CategoryProduct?
    
    init(urlString: String, apiService:ApiServiceProtocol){
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString){
            self.apiService?.get(url: url)
        }
        fetchDataCategory()
    }
    
    func fetchDataCategory() {
        self.apiService?.callApi(model: CategoryProduct.self, completion: { response in
            switch response {
            case .success (let success):
                self.bindTypeProductCategory?(success)
            case .failure (_):
                self.bindTypeProductCategory?(nil)
            }
            
        })
    }
    
    
    
    
}
