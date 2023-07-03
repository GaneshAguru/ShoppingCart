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
    
    func addRegistrationDetails(firstName:String,lastName:String,userid:String,password:String,mobile:String)->RegistrationEntity{
        
        let register = RegistrationEntity(context: dbContext)
        register.firstname = firstName
        register.lastname = lastName
        register.userid = userid
        register.password = password
        register.mobile = mobile
        
        do{
            try dbContext.save()
            return register
        }catch{
            print(error.localizedDescription)
        }
        return register
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
            
            return result
        }catch{
            print(error.localizedDescription)
           
        }
        return []
    }
    
    
}
