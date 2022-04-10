//
//  Order.swift
//  guided project restaurant
//
//  Created by Владислав Левченко on 10.04.2022.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
