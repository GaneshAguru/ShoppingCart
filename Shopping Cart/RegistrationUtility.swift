//
//  RegistrationUtility.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import Foundation
import UIKit

struct RegistrationUtility{
    
    static var instance = RegistrationUtility()
    
    let dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    private init(){
        
    }
    
    
    func addRegistrationDetails(name:String,userid:String,password:String,mobile:String){
        
        
        let register = RegistrationEntity(context: dbContext)
        
        register.name = name
        register.userid = userid
        register.password = password
        register.mobile = mobile
        do{
            try dbContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    func getRegistrationData()->[RegistrationEntity]{
        
        let registrationData = RegistrationEntity.fetchRequest()
        do{
            let result = try dbContext.fetch(registrationData)
            return result
        }catch{
            print(error.localizedDescription)
        }
        return []
    }
    
    
    
    func verifyUserByUserId(userid:String,password:String) ->[RegistrationEntity]{
        
        let useridReq = RegistrationEntity.fetchRequest()
        useridReq.predicate = NSPredicate(format: "userid == %@", userid)
        useridReq.predicate = NSPredicate(format: "password == %@", password)
        
        do{
            let result = try dbContext.fetch(useridReq)
            print("result:\(result)")

            return result
        }catch{
            print(error.localizedDescription)
            print("^^^^^^^^^^^^^^^^^^^^^^^")
        }
        return []
    }
    
    
}
