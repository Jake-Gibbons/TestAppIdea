//
//  Item.swift
//  TestAppIdea
//
//  Created by Jake Gibbons on 19/06/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
