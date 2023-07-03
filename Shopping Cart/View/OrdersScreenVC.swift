//
//  OrdersScreenVC.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import UIKit

class OrdersScreenVC: UIViewController {

 
    var id :String = ""

    var orderData:[OrdersEntity] = []
    var ordersVM = OrderUtilityViewModel()
    
    
    @IBOutlet weak var ordersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        ordersTableView.dataSource = self
        ordersTableView.delegate = self
        
        id = DataModel.shared.sharedId
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        
        orderData = ordersVM.gerAllOrdersVM()
        ordersTableView.reloadData()
    }

}



extension OrdersScreenVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ordersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeScreenProductsCell
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 0.5
        let data = orderData[indexPath.row]
        cell.orderDate_ordersL.text = "Order date: \(data.orderDate ?? "")"
       
       
        cell.price_ordersL.text = "Total Price: Rs.\(data.totalPrice ?? "")"
        cell.image_ordrsIV.image = UIImage(systemName: "cart.fill")

        
        return cell
    }
    
}

extension OrdersScreenVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "orderDetails") as! OrderDetailsVC
        let sendData = orderData[indexPath.row]
        vc.orderDetails = sendData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


