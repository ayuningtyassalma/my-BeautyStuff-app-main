//
//  DiscountViewModel.swift
//  my-BeautyStuff-app
//
//  Created by Phincon on 06/05/23.
//

import Foundation
protocol DiscountViewModelProtocol {
    var url : String {get}
    var bindDiscountCategory : (([CategoryModel]?)-> ())? {get set}
    func fetchDataDiscount()
}

class DiscountViewModel : DiscountViewModelProtocol {
    var url: String = ""
    private var apiService : ApiServiceProtocol?
    var bindDiscountCategory: (([CategoryModel]?) -> ())?
    var data : [CategoryModel]?
    
    init(url: String, apiService: ApiServiceProtocol){
        self.url = url
        self.apiService = apiService
        
        if let url = URL(string: url){
            self.apiService?.get(url: url)
        }
    }
    
    func fetchDataDiscount() {
        self.apiService?.callApi(model: [CategoryModel]?.self, completion: {response in
            switch response {
            case .success(let success):
                self.bindDiscountCategory?(success)
            case .failure(let error):
                self.bindDiscountCategory?(nil)

            }
        })
    }
}
