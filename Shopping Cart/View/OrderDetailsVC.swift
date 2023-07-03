//
//  OrderDetailsVC.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 21/06/23.
//

import UIKit

class OrderDetailsVC: UIViewController {

    @IBOutlet weak var orderDetailsTV: UITableView!
    
    var orderDetails : OrdersEntity? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetailsTV.dataSource = self
    }

}


extension OrderDetailsVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return orderDetails?.toCart?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderDetailsTV.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrdersDetailsCell
        
        
        if let orderItems = orderDetails?.toCart{
            var cartItemsArray :[CartEntity] = []
            for item in orderItems{
                cartItemsArray.append(item as! CartEntity)
            }
            
            cell.quantityL.text = "quantity: \(cartItemsArray[indexPath.row].quantity ?? "")"
            cell.imageIV.image = UIImage(named: cartItemsArray[indexPath.row].image!)
            cell.item_nameL.text = "Item: \(cartItemsArray[indexPath.row].item ?? "")"
            cell.priceL.text = "price: \(cartItemsArray[indexPath.row].price ?? "")"

        }
        
        return cell
    }


}
