//
//  AppCoordinator.swift
//  TSCoordinatorSwiftUIDemo
//
//  Created by TAE SU LEE on 5/3/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import FeatureCommon
import SwiftUI
import Combine

fileprivate extension Notification.Name {
    static let popToRoot = Notification.Name("PopToRoot")
}

public final class AppCoordinator: CoordinatorProtocol {
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Binding
    @Published private var isNavigationLinkActive = false
    private var isNavigationLinkActiveBinding: Binding<Bool> {
        Binding(
            get: { self.isNavigationLinkActive },
            set: { self.isNavigationLinkActive = $0 }
        )
    }
    @Binding private var shouldDismissSelf: Bool
    
    // MARK: - Properties
    private var appRoute: AppRoute = .aView(.init(title: ""))
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Initialize
    public init(isRoot: Bool = false, shouldDismissSelf: Binding<Bool>) {
        _shouldDismissSelf = shouldDismissSelf
        
        if isRoot {
            NotificationCenter.default.publisher(for: .popToRoot)
                .sink { [weak self] _ in
                    guard let self = self else { return }
                    isNavigationLinkActive = false
                }
                .store(in: &cancellable)
        }
    }
    
    // MARK: - CoordinatorProtocol
    public var navigationLinkSection: some View {
        NavigationLink(
            destination: appRoute.view(isNavigationLinkActiveBinding),
            isActive: isNavigationLinkActiveBinding,
            label: ({
                EmptyView()
            })
        )
        .isDetailLink(false)
    }
    
    public func push(_ appRoute: AppRoute) {
        self.appRoute = appRoute
        isNavigationLinkActive = true
    }
    
    public func pop() {
        shouldDismissSelf = false
    }
    
    public func popToRoot() {
        NotificationCenter.default.post(name: .popToRoot, object: nil)
    }
}
