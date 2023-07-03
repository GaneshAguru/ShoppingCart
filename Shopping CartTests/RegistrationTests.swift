//
//  RegistrationTests.swift
//  Shopping CartTests
//
//  Created by Aguru, Ganesh (Contractor) on 28/06/23.
//

import XCTest
@testable import Shopping_Cart

final class RegistrationTests: XCTestCase {

    let registrationVM = RegistrationUtilityViewModel()
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
    
    
    func testAddRegistration(){

        let firstName = "Ram"
        let lastName = "Sai"
        let userid = "ram@gmail.com"
        let password = "1234"
        let mobile = "8688880438"

//        registrationVM.addRegistrationDetailsVM(firstName: firstName, lastName: lastName, userid: userid, password: password, mobile: mobile)

        let registrationDetails = RegistrationUtility.instance.addRegistrationDetails(firstName: firstName, lastName: lastName, userid: userid, password: password, mobile: mobile)

        print(registrationDetails)
        
        XCTAssertEqual(registrationDetails.mobile, mobile)

    }
    
    
    func testGetRegistrationDetails(){
        
        
        let firstName = "Sai"
        let lastName = "Ram"
        let userid = "sai@gmail.com"
        let password = "1111"
        let mobile = "8688880438"

        let registrationDetails = RegistrationUtility.instance.addRegistrationDetails(firstName: firstName, lastName: lastName, userid: userid, password: password, mobile: mobile)
        
        let details = RegistrationUtility.instance.getRegistrationData()
        
        XCTAssertEqual(registrationDetails.userid, details.first?.userid)
        
    }
    
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
