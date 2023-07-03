//
//  ProductDetailsScreenVC.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import UIKit
import SwiftUI

class ProductDetailsScreenVC: UIViewController {
    
    var itemDetails : ProductEntity? = nil
    
    var registrationData : [RegistrationEntity] = []
    var cartVM = CartUtilityViewModel()
    
    
    var userId : String = ""
    
    @IBOutlet weak var itemIV: UIImageView!
    
    @IBOutlet weak var itemNameL: UILabel!
    
    @IBOutlet weak var descL: UILabel!
    
    @IBOutlet weak var priceL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemIV.image = UIImage(named: (itemDetails?.image)!)
        itemNameL.text = itemDetails?.item
        descL.text = itemDetails?.desc
        priceL.text = "Rs. \(itemDetails?.price ?? "")"


    }
    

    
    @IBAction func addToCartButton(_ sender: Any) {
        
        userId = DataModel.shared.sharedId
        
        print("userId\(userId)")

        
        cartVM.addCartItemVM(userId: userId, item: itemDetails?.item ?? "", price: itemDetails?.price ?? "", quantity: "1", image: (itemDetails?.image)!, itemid: itemDetails?.productid ?? "")
        
        let alert = UIAlertController(title: "Item added to cart successfully", message: "Check it, in the Cart", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(addAction)
        
        present(alert, animated: true)
        
    }
    

}
