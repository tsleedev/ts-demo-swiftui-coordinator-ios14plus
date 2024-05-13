//
//  FeatureMain.swift
//  TSCoordinatorSwiftUIDemo
//
//  Created by TAE SU LEE on 5/3/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import FeatureCommon
import FeatureA
import FeatureB
import FeatureC
import SwiftUI

extension AppRoute {
    @ViewBuilder
    func view(_ isActive: Binding<Bool>) -> some View {
        switch self {
        case .aView(let item):
            AView(coordinator: AppCoordinator(shouldDismissSelf: isActive), item: item)
        case .bView(let item):
            BView(coordinator: AppCoordinator(shouldDismissSelf: isActive), item: item)
        case .cView(let item):
            CView(coordinator: AppCoordinator(shouldDismissSelf: isActive), item: item)
        }
    }
}
