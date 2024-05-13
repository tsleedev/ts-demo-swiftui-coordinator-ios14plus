//
//  BView.swift
//  TSCoordinatorSwiftUIDemo
//
//  Created by TAE SU LEE on 5/3/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import FeatureCommon
import SwiftUI

public struct BView<Coordinator: CoordinatorProtocol>: View {
    @StateObject var coordinator: Coordinator
    private let item: Item
    
    public init(coordinator: Coordinator, item: Item) {
        _coordinator = StateObject(wrappedValue: coordinator)
        self.item = item
    }
    
    public var body: some View {
        VStack {
            coordinator.navigationLinkSection
            Text("BView \(item.title)")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(.aView(.init(title: "From BView")))
                } label: {
                    Image(systemName: "a.square.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(.bView(.init(title: "From BView")))
                } label: {
                    Image(systemName: "b.square.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(.cView(.init(title: "From BView")))
                } label: {
                    Image(systemName: "c.square.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.pop()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.popToRoot()
                } label: {
                    Image(systemName: "house")
                }
            }
        }
    }
}

#if DEBUG
private final class MockCoordinator: CoordinatorProtocol {
    var navigationLinkSection: some View { EmptyView() }
    func push(_ appRoute: AppRoute) { }
    func pop() { }
    func popToRoot() { }
}

#Preview {
    NavigationView {
        BView(
            coordinator: MockCoordinator(),
            item: .init(title: "")
        )
    }
}
#endif
