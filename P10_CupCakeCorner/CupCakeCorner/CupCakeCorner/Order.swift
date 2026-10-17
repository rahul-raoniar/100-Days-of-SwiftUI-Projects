//
//  Order.swift
//  BasicOrder
//
//  Created by Rahul Raoniar on 22/09/2026.
//

import Foundation

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinklers = "addSprinklers"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strewberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 0
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinklers = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinklers = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    
    var cost: Decimal {
        //$2 per cup cake
        
        var cost = Decimal(quantity) * 2
        
        //for complicated cake
        cost += Decimal(type) / 2
        
        //$1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.5/cake for sprinklers
        if addSprinklers {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}
