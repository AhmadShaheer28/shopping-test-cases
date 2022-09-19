class Product : Equatable, Hashable, Comparable {
    
    /** The name of a product, as would be shown on a receipt*/
    var name :String
    
    /** Price, in pence */
    var price :Int
    
    /** Unique id of a product, akin to a bar code */
    var id :Int
    
    init(_ name:String, price:Int, id:Int){
        self.name = name
        self.price = price
        self.id = id
    }
    
    static func <(lhs: Product, rhs: Product) -> Bool {
        return lhs.id < rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    

}

