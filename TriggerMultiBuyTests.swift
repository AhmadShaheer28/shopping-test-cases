//
//  TriggerMultiBuyTests.swift
//  ShoppingTests
//
//  Created by Andrew Muncey on 22/02/2022.
//  Copyright © 2022 University of Chester. All rights reserved.
//

import XCTest

class TriggerMultiBuyTests: XCTestCase {

    var offer : FreeTableSauceWithMeatOffer!
    var list = [Product]()
    override func setUp()  {
        super.setUp()
        offer = FreeTableSauceWithMeatOffer()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        offer = nil
    }

    func testApplicable() throws {
        
        XCTAssertFalse(offer.applies(to: list)) // shouldnt apply to empty list
        
        list = [P.chocPudding, P.coke, P.comfortSoftener, P.cookies, P.garlicBread, P.flatGarlicBread]
        
        XCTAssertFalse(offer.applies(to: list)) // shouldnt apply to wrong items
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke]
        
        XCTAssertFalse(offer.applies(to: list)) // shouldnt apply if only meat purchased
        
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke, P.ketchup, P.mayo]
        
    }
    
    func testDiscount() throws {
        
        
        XCTAssertEqual(0, offer.discount(for: list)) // shouldnt apply to empty list
        
        list = [P.chocPudding, P.coke, P.comfortSoftener, P.cookies, P.garlicBread, P.flatGarlicBread]
        
        XCTAssertEqual(0, offer.discount(for: list))// shouldnt apply to wrong items
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke]
        
        XCTAssertEqual(0, offer.discount(for: list)) // shouldnt apply if only meat purchased
        
        
        list = [P.mince, P.porkChops, P.smokedBacon, P.ariel, P.coke, P.ketchup, P.mayo]
        XCTAssertEqual(248, offer.discount(for: list))
        
        
    }


}
