///Free Table Sauce with 🍗🍗🍗
class FreeTableSauceWithMeatOffer : TriggerMultiBuy {
    var triggerProductIds: Set<Int>
    
    var discountableProductIds: Set<Int>
    
    var quantityFree: Int
    
    var name: String
    
    var quantityPaid: Int
   var productIds: Set<Int>
    
    
    init(){
        name = "Free Sauce with Meat"
        triggerProductIds = [301,302,303,304,305,306]
        discountableProductIds = [54321, 54322]
        quantityPaid = 3;
        quantityFree = 2;
        productIds = triggerProductIds.union(discountableProductIds)
    }
    
    func applies(to purchases: [Product]) -> Bool {
       
      return false
        
    }
    
    func discount(for purchases: [Product]) -> Int {
        
        return 0
        
    }
    
}
