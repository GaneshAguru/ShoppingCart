//
//  HomeScreenProductsCell.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import UIKit

class HomeScreenProductsCell: UITableViewCell {

    
    //for home screen table view
    @IBOutlet weak var itemL: UILabel!
    @IBOutlet weak var priceL: UILabel!
    @IBOutlet weak var imageL:UIImageView!
    
    
    
    //for orders table view
    @IBOutlet weak var orderDate_ordersL: UILabel!
    @IBOutlet weak var price_ordersL: UILabel!
    @IBOutlet weak var image_ordrsIV:UIImageView!
    
    
    //for cart table view
    @IBOutlet weak var item_desc_cartL: UILabel!
    @IBOutlet weak var price_cartL: UILabel!
    @IBOutlet weak var image_cartIV:UIImageView!
    @IBOutlet weak var quantity_cartL: UILabel!
    @IBOutlet weak var incrementStepper: UIStepper!
    
}
