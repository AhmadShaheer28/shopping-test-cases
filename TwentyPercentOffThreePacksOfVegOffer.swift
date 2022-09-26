
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
        var prod_list = [Int]()
        for id in productIds {
            for product in purchases {
                if product.id == id {
                    prod_list.append(id)
                }
            }
        }
        
        if prod_list.count >= quantityPaid {
            return true
        }
        return false
    }
    
    func discount(for purchases: [Product]) -> Int {
        var total = 0
        var prod_list = [Int]()
        for id in productIds {
            for product in purchases {
                if product.id == id {
                    prod_list.append(id)
                    total += product.price
                }
            }
        }
        
        if prod_list.count >= quantityPaid {
            return Int(Double(total) * discountPercentage)
        }
        
        return total
    }
    
    
}


