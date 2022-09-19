///Buy one get one free on varients of Coca-Cola
class BuyOneGetOneFreeOffer : MultiBuyOffer {
    
    var name: String
    var productIds : Set<Int>
    var quantityPaid: Int
    var quantityFree: Int

    init(){
    name = "2 for 1 on Coca-Cola"
    productIds = [401,402,403];
        quantityPaid = 1
        quantityFree = 1
    }
    func applies(to purchases: [Product]) -> Bool {
        var count = 0
        for id in productIds {
            for product in purchases {
                if product.id == id {
                    count+=1
                }
            }
        }
        
        if count > 1{
            return true
        }
        return false
   }
    
    func discount(for purchases: [Product]) -> Int {
        var total = 0
        var count = 0
        var pre_price=0
        var prod_list=purchases
        prod_list.sort(by: { $0.price > $1.price })
        for product in prod_list {
            for  id in productIds{
                if product.id == id {
                    count+=1
                    if count == 1 {
                        pre_price=(product.price)
                    }
                    if count == 2 {
                        if pre_price > (product.price){
                            pre_price = (product.price)
                        }
                        total += pre_price
                        count = 0
                    }

                }
            }
        }
        return total
    }
}



