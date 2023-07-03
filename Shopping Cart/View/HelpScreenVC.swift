//
//  HelpScreenVC.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 09/06/23.
//

import UIKit

class HelpScreenVC: UIViewController {
    
    @IBOutlet weak var faqsTableView: UITableView!
    
    let faqData = [
        ["question":"1: How can I order","answer":"A: You can order easily using our online platform. When you find a product you need, you can add it to cart, login and go through the ordering process. After the order is ready, you will receive order summary to your email. Order summary will also be stored to your account."],
        ["question":"2: Why should I buy online?","answer":"A: Speeding up the process. By ordering online you will you will get prices faster and you will be able to go through order confirmation and payment process much faster. This could save days of your time."],
        ["question":"3: What info should I input when ordering?","answer":"A: our online ordering system will ask for all the important information you should submit. If you have a VAT number, please remember to submit it. This will make sure the shipment is not delayed because of the lack of VAT number"],
        ["question":"4: Can I cancel my order?","answer":"If you want to cancel your order, please do so as soon as possible. If we have already processed your order, you need to contact us and return the product."],
        ["question":" 5: What are the delivery charges?","answer":"Delivery charges are dependent on the shipment requirements. If the products on your order are due to special requirements (for example dry ice) extra fee will be added to the shipment charges. You can see the shipping fees on the checkout process before the payment is made."],
        ["question":"6: How can I get offer of bulk amounts?","answer":"A: When you are logged in and you add products to shopping cart, you have the ability to send offer request to us using the shopping cart. You just need to add the products and quantities you are interested in and click “offer request”. We will send you an offer. Please note that this feature should only be used for bulk quantity price requests."],
        ["question":"7: Can I pay with invoice?","answer":"If you have already established customer relationship with HyTest, you will be granted ability to pay using invoice. "],
        ["question":" 8: How can I retrieve my password?","answer":"You can retrieve your password by clicking “forgot password?”. Instruction on password retrieval will be send to your email."],
        ["question":"9: Shipping cost?","answer":"A: Shipping costs are dependent on your location and products on your order. Some products need to be shipped in dry ice. These dry ice shipments have a slightly higher shipping fee. Our online store shows the shipping fee and shipping cost automatically on the checkout."]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        faqsTableView.dataSource = self
        

        
    }
    
}

extension HelpScreenVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = faqsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let selected = faqData[indexPath.row]
        
        cell.textLabel?.text = selected["question"]
        cell.textLabel?.font = UIFont(name: "Arial", size: 16)
        cell.textLabel?.textColor = .systemPink
        
        cell.detailTextLabel?.text = selected["answer"]
        cell.detailTextLabel?.numberOfLines = 7
        cell.detailTextLabel?.font = UIFont(name: "Arial", size: 14)
        return cell
    }
    
    
}
