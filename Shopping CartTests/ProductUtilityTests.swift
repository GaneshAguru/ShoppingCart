//
//  ProductUtilityTests.swift
//  Shopping CartTests
//
//  Created by Aguru, Ganesh (Contractor) on 28/06/23.
//

import XCTest
@testable import Shopping_Cart

final class ProductUtilityTests: XCTestCase {

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
    
    
    func testGetProductDetails(){
        
        //with
        let item = "Saalt"
        let desc = "With Iodization"
        let image = "salt"
        let price = "10"
        let id = "101"
        
        ProductUtility.instanceProduct.addProductList(item: item, desc: desc, image: image, price: price, id: id)
        
        //perform
        let productDetails = ProductUtility.instanceProduct.getProductList()
        
        //verify
        print(productDetails)
        print(productDetails.count)
        
        
        
        
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
