///Free bottle of 💧 (product ID 410) with every 📰 purchased (product ID 565)
class FreeWaterWithNewspaperOffer : TriggerOffer{
    
    var name: String
    var triggerProductIds : Set<Int>
    var discountableProductIds : Set<Int>
    
    init() {
        name = "Free Water with The Times"
        triggerProductIds = [565] //newspaper
        discountableProductIds = [410] //water
    }
    
    func applies(to purchases: [Product]) -> Bool {
        let purchasesIds = purchases.map { $0.id }
        let newSet = triggerProductIds.union(discountableProductIds)
        return Array(Set(purchasesIds).intersection(newSet)).count == Array(newSet).count ? true : false
    }
    
    func discount(for purchases: [Product]) -> Int {
        let waters = purchases.filter({ Array(discountableProductIds).contains($0.id) })
        let papers = purchases.filter({ Array(triggerProductIds).contains($0.id) })
        guard let waterPrice = waters.first?.price else { return 0 }
        return waters.count > papers.count ? waterPrice * papers.count : waterPrice * waters.count
    }
}
