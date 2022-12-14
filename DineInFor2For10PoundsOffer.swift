///Buy one item from each category and pay just £10
class DineInFor2For10PoundsOffer : SelectionOffer {
    
    var productIdGroups: Set<Set<Int>>
    var maxPrice: Int
    var name: String
    
    init(){
        
        let sideIds : Set<Int> = [1011,1012] //garlic bread, mushrooms
        let mainIds : Set<Int> = [305,306] //pork chops, chicken drumsticks
        let dessertIds : Set<Int> = [1001,1002,1003] //choc puding, tiramisu, profiteroles
        let wineIds : Set<Int> = [901,902] //sauv blanc, cabernet sauvignon
        
        productIdGroups = [sideIds,mainIds,dessertIds,wineIds]
        maxPrice = 1000
        
        name = "Dine in for 2 for £10"
    }
    func applies(to purchases: [Product]) -> Bool {
        let purchasesIds = purchases.map { $0.id }
        var result = true
        for productSet in productIdGroups {
            result = Array(Set(purchasesIds).intersection(productSet)).count > 0
            if result == false { break }
        }
        return result
    }
    
    func discount(for purchases: [Product]) -> Int {
        var prod_list=purchases
        prod_list.sort(by: { $0.price < $1.price })
        var total = 0
        for productSet in productIdGroups {
            var first=true
            for product in prod_list {
                for set in productSet{
                    if product.id==set && first{
                        total+=product.price
                        first=false
                    }
                    else if product.id==set && first==false 
                    {
                        total+=51
                    }
                }
                                        
            }
        }
            
        
        if total>1000
        {
            total-=1000
        }
            
        return Int(total)

    }
    
}
