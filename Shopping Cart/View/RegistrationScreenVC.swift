//
//  RegistrationScreenVC.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import UIKit

class RegistrationScreenVC: UIViewController {
   
    var registrationVM = RegistrationUtilityViewModel()
    
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButton(_ sender: UIButton) {
        
        let firstName = firstNameTF.text ?? ""
        let lastName = lastNameTF.text ?? ""
        let userId = userIdTF.text ?? ""
        let password = passwordTF.text ?? ""
        let mobile = mobileTF.text ?? ""
        
        
        guard !firstName.isEmpty else{
            
            let alert = UIAlertController(title: "Empty Data", message: "Please! fill the first name", preferredStyle: .alert)
            let addAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(addAction)
            
            present(alert, animated: true)
            
            return
        }
        
        
        guard !lastName.isEmpty else{
            
            let alert = UIAlertController(title: "Empty Data", message: "Please! fill the last name", preferredStyle: .alert)
            let addAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(addAction)
            
            present(alert, animated: true)
            
            return
        }
        
        guard !userId.isEmpty else{
            
            let alert = UIAlertController(title: "Empty Data", message: "Please! fill the UserId", preferredStyle: .alert)
            let addAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(addAction)
            
            present(alert, animated: true)
            
            return
        }
        
        guard !password.isEmpty else{
            
            let alert = UIAlertController(title: "Empty Data", message: "Please! fill the Password", preferredStyle: .alert)
            let addAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(addAction)
            
            present(alert, animated: true)
            
            return
        }
        
        
        guard !mobile.isEmpty else{
            
            let alert = UIAlertController(title: "Empty Data", message: "Please! fill the Mobile No", preferredStyle: .alert)
            let addAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(addAction)
            
            present(alert, animated: true)
            
            return
        }
        
        
      
        registrationVM.addRegistrationDetailsVM(firstName: firstName, lastName: lastName, userid: userId, password: password, mobile: mobile)

        
        let alert = UIAlertController(title: "Registration Successful", message: "Login to open Home page", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Login", style: .default) { action in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginScreen")
            self.show(vc!, sender: self)
            
        }
        alert.addAction(addAction)
        present(alert, animated: true)
        
        
        
    }
    
    
    
    


}
