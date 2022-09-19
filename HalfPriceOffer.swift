///Half price on Wine 🍷
class HalfPriceOffer : DiscountedPriceOffer {
    
    var name: String
    var productIds : Set<Int>
    var discountPercentage: Double 
    
    init(){
        name = "Half Price on Wine"
        productIds = [901,902];
        discountPercentage = 0.5
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
        var total = 0
        for id in productIds {
            for product in purchases {
                if product.id == id {
                    total += (product.price)/2
                }
            }
        }

        return Int(total)
    }
}
