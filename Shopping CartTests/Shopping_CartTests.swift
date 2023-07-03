//
//  Shopping_CartTests.swift
//  Shopping CartTests
//
//  Created by Aguru, Ganesh (Contractor) on 06/06/23.
//

import XCTest
@testable import Shopping_Cart

final class Shopping_CartTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    
    func testaddCartItem(){
       //test case for Cart Utility addcartItem

        let userId = "ganesh@gmail.com"
        let item = "Bread"
        let price = "40"
        let quantity = "2"
        let image = "bread"
        let itemid = "102"

        //perform
     let addedItem = CartUtility.cartInstance.addCartItem(userId: userId, item: item, price: price, quantity: quantity, image: image, itemid: itemid)
        
        
        //verify
        print("Status:\(addedItem)")
        XCTAssertEqual(addedItem.price, price)
       
        
    }
    
    
    func testDeleteCartItem(){
       
        let userId = "ganeshaguru@gmail.com"
        let item = "Milk"
        let price = "60"
        let quantity = "2"
        let image = "milk"
        let itemid = "102"
      

        //perforn
     let deleteStatus = CartUtility.cartInstance.addCartItem(userId: userId, item: item, price: price, quantity: quantity, image: image, itemid: itemid)
        
        print("Status:\(deleteStatus)")
        CartUtility.cartInstance.deleteCartItem(item: deleteStatus)

        print("-------------------")
       
        print("Status:\(deleteStatus)")
        
    }
    
    


    
   
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
