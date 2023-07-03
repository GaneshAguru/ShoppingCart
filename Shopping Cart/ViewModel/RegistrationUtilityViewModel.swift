//
//  RegistrationUtilityViewModel.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 26/06/23.
//

import Foundation

struct RegistrationUtilityViewModel{
    
    private let shared = RegistrationUtility.instance
    
    
    
    func addRegistrationDetailsVM(firstName:String,lastName:String,userid:String,password:String,mobile:String){
        
        shared.addRegistrationDetails(firstName: firstName, lastName: lastName, userid: userid, password: password, mobile: mobile)
        
    }
    
    
    func getRegistrationDataVM()->[RegistrationEntity]{
        
        let result = shared.getRegistrationData()
        return result
        
    }
    
    
    func verifyUserByUserIdVM(userid:String,password:String) ->[RegistrationEntity]{
        
        let result = shared.verifyUserByUserId(userid: userid, password: password)
        return result
        
    }
    
    
    
    
    
    
    
}
