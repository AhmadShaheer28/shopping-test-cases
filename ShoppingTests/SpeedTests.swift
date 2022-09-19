import XCTest

class J_SpeedTests: XCTestCase {

    
    func testHalfPriceA(){
        let testProducts = [P.🍾,P.🍾,P.🍾,P.🍾]
        XCTAssertTrue(Helper.shared.offer(HalfPriceOffer(), hasFasterAppliesMethodWith: testProducts), "HalfPriceOffer 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    
    func testBOGOF(){
        let testProducts = [P.coke, P.dietcoke, P.dietcoke, P.cokezero]
        XCTAssertTrue(Helper.shared.offer(BuyOneGetOneFreeOffer(), hasFasterAppliesMethodWith: testProducts),"BOGOFOffer 'appliesTo' method should be quicker than the 'discountFrom' method")
    }
    
    func testBuyTwoGetThirdFree(){
        let testProducts = [P.dove, P.dove, P.dove, P.lynx, P.lynx, P.lynx]
        XCTAssertTrue(Helper.shared.offer(BuyTwoGetThirdFreeOffer(), hasFasterAppliesMethodWith: testProducts), "B2G3F 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    
    func testThreeMeat(){
        let testProducts = [P.smokedBacon,P.unsmokedBacon,P.chicken,P.mince,P.porkChops, P.chocPudding]
        XCTAssertTrue(Helper.shared.offer(ThreeMeatsForTenPoundOffer(), hasFasterAppliesMethodWith: testProducts), "B2G3F 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    
    
    func testWaterPaper(){
        let testProducts = [P.📰,P.📰,P.📰,P.📰,P.📰,P.📰,P.📰,P.💧]
        XCTAssertTrue(Helper.shared.offer(FreeWaterWithNewspaperOffer(), hasFasterAppliesMethodWith: testProducts), "B2G3F 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    func testFreeSauceWithMeat(){
        let testProducts = [P.mince, P.porkChops, P.smokedBacon]
        XCTAssertTrue(Helper.shared.offer(FreeTableSauceWithMeatOffer(), hasFasterAppliesMethodWith: testProducts), "B3G2SF 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    func testDineIn(){
        XCTAssertTrue(Helper.shared.offer(DineInFor2For10PoundsOffer(), hasFasterAppliesMethodWith: [P.🍷,P.🍗,P.mushrooms,P.chocPudding]))
    }

  

    func testBuyThreeGetTwentyPercentApplies(){
        let testProducts = [P.mushrooms, P.mushrooms, P.mushrooms]
        XCTAssertTrue(Helper.shared.offer(TwentyPercentOffThreePacksOfVegOffer(), hasFasterAppliesMethodWith: testProducts), "B3GTwentyPercent 'appliesTo' method should be quicker than its 'discountFrom' method")
    }
    
}
