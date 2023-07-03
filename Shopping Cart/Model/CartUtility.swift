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
    
    func addCartItem(userId:String,item:String,price:String,quantity:String,image:String,itemid:String)->CartEntity{
        
        let cartItem = CartEntity(context: dbContext)
        
        
        cartItem.userid = userId
        cartItem.item = item
        cartItem.price = price
        cartItem.quantity = quantity
        cartItem.image = image
        cartItem.itemid = itemid
        
        do{
            try dbContext.save()
            return cartItem
        }catch{
            print(error.localizedDescription)
        }
        return cartItem
        
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
        var newCartItems : [CartEntity] = []
        
        let fetchReq = CartEntity.fetchRequest()
        fetchReq.predicate = NSPredicate(format: "userid == %@", userid)
        do{
            let result = try dbContext.fetch(fetchReq)
            for item in result {
                if item.toOrder == nil {
                    newCartItems.append(item)
                }
            }
            return newCartItems
        }
        catch{
            print(error.localizedDescription)
        }
        
        return []
    }
    
    
    func deleteCartItem(item:CartEntity){
        
        dbContext.delete(item)
        do{
            try dbContext.save()
        }catch{
            print(error.localizedDescription)
        }
        
        
    }
    
    
    
    func deleteAllCartItems(allItems:[CartEntity]){
        for cartItem in allItems{
            dbContext.delete(cartItem)
        }
        do{
            try dbContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    func updateCartItemQuantity(itemid:String,quantity:String){
        
        let fetchReq = CartEntity.fetchRequest()
        fetchReq.predicate = NSPredicate(format: "itemid == %@",itemid)
        do{
            let fetchResults = try dbContext.fetch(fetchReq)
            
            fetchResults.first?.quantity = quantity
            print(fetchResults.first?.quantity as Any)
            
            do{
                try dbContext.save()
            }catch{
                
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    
    
    
}

