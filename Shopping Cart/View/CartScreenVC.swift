//
//  CartScreenVC.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/2023.
//

import UIKit

class CartScreenVC: UIViewController {

    @IBOutlet weak var cartItemsTableView: UITableView!
    
    @IBOutlet weak var placeOrderButton: UIButton!
    
    @IBOutlet weak var numberOfCartItemsL: UILabel!
    @IBOutlet weak var totalPriceL: UILabel!
    //----->
    var cartVM = CartUtilityViewModel()
    var ordersVM = OrderUtilityViewModel()
    
    var id :String = ""
    var userCartDetails : [CartEntity] = []
//    var totalAmout :Int = 0
//    var pricesArray :[Int] = []
    var quantity : Int = 0
    var stepSelection : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
//
        numberOfCartItemsL.text = "Your Cart Items"
 //
        cartItemsTableView.dataSource = self
        cartItemsTableView.delegate = self
        
        id = DataModel.shared.sharedId
        
        

        userCartDetails = cartVM.getCartDetailsBasedOnUserIdVM(userid: id)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        var totalAmout :Int = 0
        var pricesArray :[Int] = []
        
        userCartDetails = cartVM.getCartDetailsBasedOnUserIdVM(userid: id)
        userCartDetails.forEach { itemData in
            let priceInString = Int(itemData.price ?? "")
            let price = priceInString
            let quantityNum = Int(itemData.quantity ?? "")
            let count = quantityNum
            let cumulativePrice = (price ?? 0)*(count ?? 0)
            
                pricesArray.append(cumulativePrice)

        }
        pricesArray.forEach({ price in
            totalAmout = price + totalAmout
        })
        
        totalPriceL.text = "Rs.\(String(totalAmout))"
        cartItemsTableView.reloadData()
        placeOrderButton.isHidden = false
    }
    
   

    
    @IBAction func placeAnOrderButton(_ sender: UIButton) {
        let date = Date()
        
        var totalAmout :Int = 0
        var pricesArray :[Int] = []
        
        userCartDetails = cartVM.getCartDetailsBasedOnUserIdVM(userid: id)
        userCartDetails.forEach { itemData in
            let priceInString = Int(itemData.price ?? "")
            let price = priceInString
            let quantityNum = Int(itemData.quantity ?? "")
            let count = quantityNum
            let cumulativePrice = (price ?? 0)*(count ?? 0)
            
                pricesArray.append(cumulativePrice)

        }
        pricesArray.forEach({ price in
            totalAmout = price + totalAmout
        })

        
        let allCartItems = cartVM.getCartDetailsVM()

        
        ordersVM.addToOrdersVM(totalPrice: String(totalAmout), orderDate: date.formatted(), orderId: "1", items: allCartItems)
        
       
        
        
        ///
        let alert = UIAlertController(title: "Order placed Successfully", message: "", preferredStyle: .alert)
        
         let addAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(addAction)
        present(alert, animated: true)
        
        userCartDetails = []
        totalPriceL.text = ""
        cartItemsTableView.reloadData()
        numberOfCartItemsL.text = "Your Cart Items: 0"
        placeOrderButton.isHidden = true
        totalAmout = 0
        
        
    }
    
    
    
    @IBAction func quantityUpadateStepper(_ sender: UIStepper) {
        quantity = Int(sender.value)

        let index = sender.tag
    
        guard let itemid = userCartDetails[index].itemid else { return  }
    
        
        cartVM.updateCartItemQuantityVM(itemid: itemid, quantity: String(quantity))
        
        userCartDetails[index].quantity = "\(quantity)"
        cartItemsTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
 
        
        ////
        
        
        var pricesnewArray :[Int] = []
        var totalPrice:Int = 0
        
        userCartDetails.forEach { itemData in
      
            let priceInString = Int(itemData.price ?? "")
            let price = priceInString
            let quantityNum = Int(itemData.quantity ?? "")
            let count = quantityNum
            let cumulativePrice = (price ?? 0)*(count ?? 0)
            
            pricesnewArray.append(cumulativePrice)
            

        }
        pricesnewArray.forEach({ price in
            totalPrice = price + totalPrice
        })
        totalPriceL.text = "Rs.\(String(totalPrice))"
        
        /////
    
    }
    
}




extension CartScreenVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userCartDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = cartItemsTableView.dequeueReusableCell(withIdentifier: "ordersCell", for: indexPath) as! HomeScreenProductsCell
        
        let cartItemsData = userCartDetails[indexPath.row]
        cell.incrementStepper.tag = indexPath.row
        
        
        
        cell.image_cartIV.image = UIImage(named: cartItemsData.image!)
        cell.item_desc_cartL.text = cartItemsData.item
        cell.quantity_cartL.text = cartItemsData.quantity
        let quant = Double(cartItemsData.quantity ?? "")
        cell.incrementStepper.value = quant ?? 0
        cell.price_cartL.text = "Rs. \(cartItemsData.price ?? "")"
                return cell
    }
    
    
}

extension CartScreenVC:UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction.init(style: .destructive, title: "Delete") { _, _, _ in
            let deleteCartItem = self.userCartDetails[indexPath.row]

            
            self.cartVM.deleteCartItemVM(item: deleteCartItem)
            self.userCartDetails.remove(at: indexPath.row)
            
            ////
            
            var pricesnew2Array :[Int] = []
            var totalPrice2:Int = 0
            
            self.userCartDetails.forEach { itemData in
          
                let priceInString = Int(itemData.price ?? "")
                let price = priceInString
                let quantityNum = Int(itemData.quantity ?? "")
                let count = quantityNum
                let cumulativePrice = (price ?? 0)*(count ?? 0)
                
                pricesnew2Array.append(cumulativePrice)
                

            }
            pricesnew2Array.forEach({ price in
                totalPrice2 = price + totalPrice2
            })
            self.totalPriceL.text = "Rs.\(String(totalPrice2))"
            
            ////
            
            
            self.cartItemsTableView.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
    }
    

}
