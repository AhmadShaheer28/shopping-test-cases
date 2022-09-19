
import XCTest

class A_TransactionTests: XCTestCase {
    
    var transaction : Transaction!
    
    override func setUp() {
        super.setUp()
        transaction = Transaction()
    }
    
    override func tearDown() {
        transaction = nil
        super.tearDown()
    }
    
    
    func testSumProducts(){
        transaction.items = [P.🍾, P.🍷] // 499p, 299p
        XCTAssertEqual(transaction.priceBeforeDiscounts(), 798, "Price addition correct")
        transaction.items.append(P.mince) // Lean Beef Mince 300g 500p
        XCTAssertEqual(transaction.priceBeforeDiscounts(), 1298, "Price addition correct")
    }
    
    func testDiscount(){
        transaction.couponsEnabled = true
        transaction.items = [P.mince] // 500p
        XCTAssertEqual(transaction.finalPrice(), 490, "Discount applied")
        
    }

}


class X_ReceiptTests : XCTestCase {
    
    var transaction : Transaction!
    
    override func setUp() {
        super.setUp()
        transaction = Transaction()
    }
    
    override func tearDown() {
        transaction = nil
        super.tearDown()
    }
    
    
    func testReceipt(){
        
       transaction.items = [P.🍾, P.🍷, P.coke, P.dietcoke, P.dietcoke, P.dietcoke, P.smokedBacon, P.unsmokedBacon, P.chicken, P.mince, P.porkChops, P.📰, P.💧, P.📰, P.💧, P.💧, P.lynx, P.lynx, P.lynx, P.dove, P.dove, P.dove]
        
        let receiptPrinter = ReceiptPrinter(transaction: transaction)
        let receipt = receiptPrinter.print().trimmingCharacters(in: .whitespacesAndNewlines)
        
        let bundle = Bundle(for: X_ReceiptTests.self)
        let fileLocation = bundle.path(forResource: "TestReceipt", ofType: "txt")
        do {
            let testReceiptText = try String(contentsOfFile: fileLocation!, encoding:  String.Encoding.utf8).trimmingCharacters(in: .whitespacesAndNewlines)
            XCTAssertEqual(receipt, testReceiptText)
        }
        catch{
            print("file read error")
        }
        
        
    }
    
    
}
