//
//  FeatureMain.swift
//  TSCoordinatorSwiftUIDemo
//
//  Created by TAE SU LEE on 5/3/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import FeatureCommon
import SwiftUI

public struct MainView: View {
    @StateObject var coordinator: AppCoordinator
    
    public init() {
        _coordinator = StateObject(wrappedValue: AppCoordinator(isRoot: true, shouldDismissSelf: .constant(false)))
    }
    
    public  var body: some View {
        LazyVStack {
            coordinator.navigationLinkSection
            Text("MainView")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(.aView(.init(title: "From Main")))
                } label: {
                    Image(systemName: "a.square.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(.bView(.init(title: "From Main")))
                } label: {
                    Image(systemName: "b.square.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(.cView(.init(title: "From Main")))
                } label: {
                    Image(systemName: "c.square.fill")
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        MainView()
    }
}
