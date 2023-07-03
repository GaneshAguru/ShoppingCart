//
//  CartUtilityViewModel.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 26/06/23.
//

import Foundation


struct CartUtilityViewModel{
    
    private let shared = CartUtility.cartInstance
    
    
    
    func addCartItemVM(userId:String,item:String,price:String,quantity:String,image:String,itemid:String){
        
        
        shared.addCartItem(userId: userId, item: item, price: price, quantity: quantity, image: image, itemid: itemid)
    }
    
    
    func getCartDetailsVM()->[CartEntity]{
        
        let result = shared.getCartDetails()
        
        return result
    }
    
    
    
    func getCartDetailsBasedOnUserIdVM(userid:String)->[CartEntity]{
        
        let result = shared.getCartDetailsBasedOnUserId(userid: userid)
        return result
    }
    
    
    func deleteCartItemVM(item:CartEntity){
        
        shared.deleteCartItem(item: item)
    }
    
    
    func deleteAllCartItemsVM(allItems:[CartEntity]){
        
    
        shared.deleteAllCartItems(allItems: allItems)
    }
    
    
    func updateCartItemQuantityVM(itemid:String,quantity:String){
        
        shared.updateCartItemQuantity(itemid: itemid, quantity: quantity)
        
    }
    
    
    
    
    
    
    
}
