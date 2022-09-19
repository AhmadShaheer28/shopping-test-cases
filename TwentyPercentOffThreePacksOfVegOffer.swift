
class TwentyPercentOffThreePacksOfVegOffer : MultiBuyByPercentageOffer {
var quantityPaid: Int

var discountPercentage: Double

var productIds: Set<Int>

var name: String

    init(){
        quantityPaid = 3
        discountPercentage = 0.2
        name = "Buy any three save 20%"
        productIds = Set([1012])
    }
    func applies(to purchases: [Product]) -> Bool {
        for id in productIds {
            if purchases.contains(where: { $0.id == id }) {
                return true
            }
        }
        return false
    }
    
    func discount(for purchases: [Product]) -> Int {
        
        return 0
    }
    
}
