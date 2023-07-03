//
//  OrdersUtility.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 19/06/23.
//

import Foundation
import UIKit

struct OrdersUtility{
    
    
    static var ordersInstance = OrdersUtility()
    
    var dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init(){
        
    }
    
    
    func addToOrders(totalPrice:String,orderDate:String,orderId:String,items:[CartEntity]){
        
        let orderData = OrdersEntity(context: dbContext)
        orderData.totalPrice = totalPrice
        orderData.orderDate = orderDate
        
        orderData.orderId = orderId
        
        for item in items{
            
            item.toOrder = orderData
            orderData.addToToCart(item)
            
        }
        
        do{
            try dbContext.save()
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    
    func gerAllOrders()->[OrdersEntity]{
        
        let fetchReq = OrdersEntity.fetchRequest()
        do{
            let result = try dbContext.fetch(fetchReq)
            return result
        }catch{
            print(error.localizedDescription)
        }
        return []
    }
    
    
    func getAllOrdersBasedOnUserId(userId:String)->[OrdersEntity]{
        
        let fetchReq = OrdersEntity.fetchRequest()
        fetchReq.predicate = NSPredicate(format: "userId == %@", userId)
        do{
            let result = try dbContext.fetch(fetchReq)
            return result
        }catch{
            print(error.localizedDescription)
        }
        return []
        
    }
    
    
    
}
