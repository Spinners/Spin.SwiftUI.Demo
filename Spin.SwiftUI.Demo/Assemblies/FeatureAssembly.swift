//
//  FeatureAssembly.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI
import Swinject

final class FeatureAssembly: Assembly {
    func assemble(container: Container) {

        container.register(AppView.self) { resolver -> AppView in
            let planetsView = resolver.resolve(PlanetsView.self)!
            let peoplesView = resolver.resolve(PeoplesView.self)!
            let starshipsView = resolver.resolve(StarshipsView.self)!

            return AppView(planetsView: planetsView, peoplesView: peoplesView, starshipsView: starshipsView)
        }

        container.register(PlanetsView.self) { resolver -> PlanetsView in
            return PlanetsView(store: Store(value: PlanetsFeature.State.idle))
        }

        container.register(PeoplesView.self) { resolver -> PeoplesView in
            return PeoplesView(store: Store(value: PeoplesFeature.State.idle))
        }

        container.register(StarshipsView.self) { resolver -> StarshipsView in
            return StarshipsView(store: Store(value: StarshipsFeature.State.idle))
        }
    }
}
