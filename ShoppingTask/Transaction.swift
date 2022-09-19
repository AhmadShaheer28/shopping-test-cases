class Transaction {
    
    /**
     Whether coupons (such as 10p off) can be used for the transaction
     */
    var couponsEnabled = false
    
    /**
     All the products being purchased (i.e. the items put through the till)
     */
    var items = [Product]()
    
    /**
     Adds up the price of all products in the items collection (without any discount being applied)
     */
    func priceBeforeDiscounts() -> Int{
        //TODO: Implement method to calculate price before discounts are applied
        var total = 0
        for item in items {
            total += item.price
        }
        
        return total
    }
    
    /**
     Calculates the total discount for the products in items
     */
    func discount() -> Int{
        
        let discounts = Discounter(couponsEnabled: couponsEnabled).offerDiscounts(list: items)
        var total = 0;
        for discount in discounts {
            total += discount.valueInPence;
        }
        return  total;
    }
    
    /**
     Returns the final price, that is the price before discount with the discount subtracted
     */
    func finalPrice() -> Int{
        
        //TODO: Implement method to calculate final price
        
        return priceBeforeDiscounts()-discount()
    }
    
    
}
