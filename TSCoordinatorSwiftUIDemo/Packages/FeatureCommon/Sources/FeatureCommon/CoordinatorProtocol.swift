//
//  CoordinatorProtocol.swift
//  TSCoordinatorSwiftUIDemo
//
//  Created by TAE SU LEE on 5/3/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import SwiftUI

public protocol CoordinatorProtocol: ObservableObject {
    associatedtype ContentView: View
    
    @ViewBuilder var navigationLinkSection: ContentView { get }
    func push(_ appRoute: AppRoute)
    func pop()
    func popToRoot()
}
