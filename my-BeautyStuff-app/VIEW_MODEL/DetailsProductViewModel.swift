//
//  DetailsProductViewModel.swift
//  my-BeautyStuff-app
//
//  Created by Salma Ayu on 06/05/23.
//

import Foundation

protocol DetailsProductViewModelProtocol{
    var urlString : String {get}
    var bindDetailsProduct : ((CategoryModel?)->())? {get set}
    func fetchDetailsProduct()
}

class DetailsProductViewModel : DetailsProductViewModelProtocol {
    var urlString: String = ""
    var bindDetailsProduct: ((CategoryModel?) -> ())?
    private var apiService : ApiServiceProtocol?
    
    
    init(urlString: String, apiService: ApiServiceProtocol){
        self.urlString = urlString
        self.apiService = apiService
        if let url = URL(string: self.urlString){
            self.apiService?.get(url: url)
        }
       
    }
    
    func fetchDetailsProduct() {
        print("apalah")
        self.apiService?.callApi(model: CategoryModel.self, completion: {response in
            switch response{
            case .success(let success):
                print("sucess. \(success)")
                self.bindDetailsProduct?(success)
            case .failure(let error):
                print("errro  \(error)")
                self.bindDetailsProduct?(nil)
            }
        })
    }
    

}
