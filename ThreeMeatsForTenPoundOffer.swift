///Three meats for a maximum of £10 🍗🍗🍗
class ThreeMeatsForTenPoundOffer : CappedOffer{

    var name: String
    var productIds : Set<Int>
    var maxPrice: Int
    var productQuantity : Int
    
    init(){
        name = "Three meats for £10"
        productIds = [301,302,303,304,305,306]
        maxPrice = 1000
        productQuantity = 3
    }
    
    
    func applies(to purchases: [Product]) -> Bool {
       
        let ValidProducts = purchases.filter({ productIds.contains($0.id) })
        if ValidProducts.count < productQuantity { return false }
        let price = ValidProducts.reduce(0) { $0 + $1.price }
        return price <= maxPrice
    }
    
    func discount(for purchases: [Product]) -> Int {
        let ValidProducts = purchases.filter({ productIds.contains($0.id) })
        if ValidProducts.count < productQuantity { return 0 }
        let price = ValidProducts.reduce(0) { $0 + $1.price }
        if price > 1000
        {
            return price - 1000
        }
        return 0
    }
}
