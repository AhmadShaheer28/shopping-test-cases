
import XCTest

class MultiBuyByPercentageTest: XCTestCase {
    var offer : TwentyPercentOffThreePacksOfVegOffer!
    
    override func setUpWithError() throws {
        super.setUp()
        offer = TwentyPercentOffThreePacksOfVegOffer()
    }
    
    override func tearDown() {
        offer = nil
        super.tearDown()
    }
   
      func BuyThreeGetTwentyPercentApplies(){
        
                XCTAssertFalse(offer.applies(to: [P.mushrooms]),"Offer doesn't apply to just one valid item")
                XCTAssertFalse(offer.applies(to: [P.🍾,P.🍾]),"Offer doesn't apply to wrong products")
                XCTAssertFalse(offer.applies(to: [P.mushrooms,P.coke,P.mushrooms]),"Offer needs three valid items to apply")
                XCTAssertTrue(offer.applies(to: [P.mushrooms,P.dietcoke,P.dietcoke]),"Offer needs three valid items to apply")
        
            }
     
        func testBuyThreeGetTwentyPercentApplies(){
            BuyThreeGetTwentyPercentApplies()
        }
        
    func testTwentyPercentOffApplicable(){
        BuyThreeGetTwentyPercentApplies()
        
        let list = [P.mushrooms, P.mushrooms, P.mushrooms] 
        XCTAssertEqual(offer.discount(for:list),720, "Twenty percent discount applied only to eligible products")
    
    }
}
