//
//  CartUtility.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import Foundation
import UIKit


struct CartUtility {
    
    static var cartInstance = CartUtility()
    let dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    private init(){
        
    }
    
    func addCartItem(userId:String,item:String,price:String,quantity:String,image:String){
        
        let cartItem = CartEntity(context: dbContext)
        
        
        cartItem.userid = userId
        cartItem.item = item
        cartItem.price = price
        cartItem.quantity = quantity
        cartItem.image = image
        
        do{
            try dbContext.save()
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    
    
    func getCartDetails()->[CartEntity]{
        
        let fetchReq = CartEntity.fetchRequest()
        do{
            let result = try dbContext.fetch(fetchReq)
            return result
        }catch{
            print(error.localizedDescription)
        }
        
        return []
    }
    
    
    func getCartDetailsBasedOnUserId(userid:String)->[CartEntity]{
        
        let fetchReq = CartEntity.fetchRequest()
        fetchReq.predicate = NSPredicate(format: "userid == %@", userid)
        do{
            let result = try dbContext.fetch(fetchReq)
            return result
        }
        catch{
            print(error.localizedDescription)
        }
        
        return []
    }
    
    
}

