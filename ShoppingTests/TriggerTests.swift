import XCTest

class F_TriggerTests: XCTestCase {

    var offer : FreeWaterWithNewspaperOffer!
    
    override func setUp() {
        super.setUp()
        offer = FreeWaterWithNewspaperOffer()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        offer = nil
        super.tearDown()
    }

    // MARK: Simple Trigger Offer
    func waterApplies(){
        let offer = FreeWaterWithNewspaperOffer()
        XCTAssertFalse(offer.applies(to: [P.smokedBacon]))
        XCTAssertFalse(offer.applies(to: [P.smokedBacon, P.smokedBacon])) //2 bacon
        XCTAssertFalse(offer.applies(to: [P.💧]))
        XCTAssertFalse(offer.applies(to: [P.💧,P.💧]))
        XCTAssertFalse(offer.applies(to: [P.📰]))
        XCTAssertFalse(offer.applies(to: [P.📰,P.📰]))
        XCTAssertTrue(offer.applies(to: [P.📰,P.💧]))
        XCTAssertTrue(offer.applies(to: [P.💧,P.📰]))
    }
    
    
    func testWaterApplicable(){
        waterApplies()
    }
    
    func testPriceChange(){
        waterApplies()
        let water = P.💧
        let waterOriginalPrice = water.price
        water.price = 200
        let list = [water,P.📰]
        XCTAssertEqual(offer.discount(for:list), 200, "offer works with change in water price")
        water.price = waterOriginalPrice //needs to be put back as will persist for other tests
    }
    
    
    func testTwoWaterWithOnePaper(){
        waterApplies()
        let list = [P.💧,P.📰,P.💧]
        XCTAssertEqual(offer.discount(for:list) ,P.💧.price * 1, "1 x water correctly discounted")
    }
    
    func testMoreWatersThanPapers(){
        waterApplies()
        var list = [P.📰,P.📰,P.💧,P.💧,P.💧]
        XCTAssertEqual(offer.discount(for:list),P.💧.price * 2, "2 x water correctly discounted")
        list = [P.📰,P.📰,P.📰,P.💧,P.💧,P.💧,P.💧,P.💧,P.💧]
        XCTAssertEqual(offer.discount(for:list),P.💧.price * 3, "3 x water correctly discounted")
    }
    
    func testMorePapersThanWaters(){
        waterApplies()
        var list =  [P.📰,P.📰,P.📰,P.💧,P.💧]
        XCTAssertEqual(offer.discount(for:list),P.💧.price * 2, "2 x water correctly discounted")
        
        list = [P.📰,P.📰,P.📰,P.📰,P.📰,P.📰,P.📰,P.💧]
        XCTAssertEqual(offer.discount(for:list),P.💧.price, "2 x water correctly discounted")
    }
    

}


