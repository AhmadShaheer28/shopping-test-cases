/// Third item free when you buy any two deodorants
class BuyTwoGetThirdFreeOffer :MultiBuyOffer {
    
    var quantityPaid: Int
    var quantityFree: Int
    var name: String
    var productIds : Set<Int>
    
    init(){
        name = "3 for 2 on Deodorants"
        productIds = [65,66];
        quantityPaid = 2
        quantityFree = 1
    }
    
    func applies(to purchases: [Product]) -> Bool {
        if purchases.count < 2 { return false }
        let purchasesIds = purchases.map { $0.id }
        return Array(Set(productIds).intersection(Set(purchasesIds))).count == 2 ? true : false
    }
    
    func discount(for purchases: [Product]) -> Int {
        return 0
    }

}
