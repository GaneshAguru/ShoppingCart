//
//  OrderUtilityViewModel.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 26/06/23.
//

import Foundation

struct OrderUtilityViewModel{
    
    private let shared = OrdersUtility.ordersInstance
    
    
    
    func addToOrdersVM(totalPrice:String,orderDate:String,orderId:String,items:[CartEntity]){
        
        shared.addToOrders(totalPrice: totalPrice, orderDate: orderDate, orderId: orderId, items: items)
        
    }
    
    
    func gerAllOrdersVM()->[OrdersEntity]{
        
        let result = shared.gerAllOrders()
        return result
    }
    
    func getAllOrdersBasedOnUserIdVM(userId:String)->[OrdersEntity]{
        
       let result = shared.getAllOrdersBasedOnUserId(userId: userId)
        return result
    }
    
    
}
