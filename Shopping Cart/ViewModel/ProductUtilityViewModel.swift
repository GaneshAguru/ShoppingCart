//
//  ProductUtilityViewModel.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 26/06/23.
//

import Foundation

struct ProductUtilityViewModel{
    
    private let shared = ProductUtility.instanceProduct
    
    func addProductListVM(item:String,desc:String,image:String,price:String,id:String){
        
        shared.addProductList(item: item, desc: desc, image: image, price: price, id: id)
        
    }
    
    
    func getProductListVM()->[ProductEntity]{
        
        let result = shared.getProductList()
        return result
    }
    
}
