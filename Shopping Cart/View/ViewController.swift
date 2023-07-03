//
//  ViewController.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 06/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    var registrationData: [RegistrationEntity] = []
    
    //create a reference to the ViewModel file
    var registrationVM = RegistrationUtilityViewModel()
    
    @IBOutlet weak var userIdTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var userId :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = true
       
        
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
       
        registrationData = registrationVM.getRegistrationDataVM()
        
         userId = userIdTF.text ?? ""
        DataModel.shared.sharedId = userId
        let password = passwordTF.text ?? ""
        
      
        let loginDetails = registrationVM.verifyUserByUserIdVM(userid: userId, password: password)
        
        var id:String = ""
        var pass:String = ""
        
        guard !loginDetails.isEmpty else{
            print("Invalid user data")
            
            let alert = UIAlertController(title: "Invalid user data", message: "Please! Enter valid credentials", preferredStyle: .alert)
            let addAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(addAction)
            
            present(alert, animated: true)
            
            return
        }
        
        if let loginDetail = loginDetails.first{
            id = loginDetail.userid ?? ""
            pass = loginDetail.password ?? ""
        }

        if id == userId && pass == password{
            
            print("Login Successful!!!!!")
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "homeTabBar") else { return  }
            show(vc, sender: true)
           

        }else{
            print("Invalid user Data")
            
        }
        
        
    }
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "registrationScreen") else { return }
        show(vc, sender: self)
        
        
    }
    
    
    

    
}

