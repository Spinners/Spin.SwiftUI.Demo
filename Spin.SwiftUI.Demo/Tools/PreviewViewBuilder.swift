//
//  PreviewViewBuilder.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-14.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Spin_Combine
import Spin_ReactiveSwift
import Spin_RxSwift

class PreviewViewBuilder: ViewBuilder {
    override func makePlanetsView() -> PlanetsView {
        return PlanetsView(context: ReactiveViewContext(state: PlanetsFeature.State.idle))
    }

    override func makePeoplesView() -> PeoplesView {
        return PeoplesView(context: RxViewContext(state: PeoplesFeature.State.idle))
    }

    override func makeStarshipsView() -> StarshipsView {
        return StarshipsView(context: CombineViewContext(state: StarshipsFeature.State.idle))
    }

    override func makePlanetView(with planet: Planet) -> LazyView<PlanetView> {
        let content = PlanetView(context: ReactiveViewContext(state: PlanetFeature.State.loading(planet: planet)))
        return LazyView(content)
    }

    override func makePeopleView(with people: People) -> LazyView<PeopleView> {
        let content = PeopleView(context: RxViewContext(state: PeopleFeature.State.loading(people: people)))
        return LazyView(content)
    }

    override func makeStarshipView(with starship: Starship) -> LazyView<StarshipView> {
        let content = StarshipView(context: CombineViewContext(state: StarshipFeature.State.loading(starship: starship)))
        return LazyView(content)
    }
}
