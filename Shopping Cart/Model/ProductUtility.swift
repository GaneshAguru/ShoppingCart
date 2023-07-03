//
//  ProductUtility.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import Foundation
import UIKit

struct ProductUtility{
    
    
    static var instanceProduct = ProductUtility()
    private init(){
        
    }
    
    let dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func addProductList(item:String,desc:String,image:String,price:String,id:String){
        let productData = ProductEntity(context: dbContext)
        productData.item = item
        productData.desc = desc
        productData.price = price
        productData.image = image
        productData.productid = id
        
        do{
            try dbContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    
    func getProductList()->[ProductEntity]{
        
        let getProductReq = ProductEntity.fetchRequest()
        do{
            let result = try dbContext.fetch(getProductReq)
            
            return result
        }catch{
            print(error.localizedDescription)
        }
        return []
    }
    
    
}
