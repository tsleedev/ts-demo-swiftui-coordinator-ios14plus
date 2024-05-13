//
//  Product.swift
//  TSCoordinatorSwiftUIDemo
//
//  Created by TAE SU LEE on 5/3/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import SwiftUI

public struct Item: Identifiable {
    public let id: UUID
    public let title: String
    
    public init(id: UUID = UUID(), title: String) {
        self.id = id
        self.title = title
    }
}
