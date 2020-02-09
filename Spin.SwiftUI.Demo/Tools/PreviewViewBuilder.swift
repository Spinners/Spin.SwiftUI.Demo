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
        return PlanetsView(uiSpin: ReactiveUISpin.makeWith(initialState: .idle))
    }

    override func makePeoplesView() -> PeoplesView {
        return PeoplesView(uiSpin: RxUISpin.makeWith(initialState: .idle))
    }

    override func makeStarshipsView() -> StarshipsView {
        return StarshipsView(uiSpin: CombineUISpin.makeWith(initialState: .idle))
    }

    override func makePlanetView(with planet: Planet) -> LazyView<PlanetView> {
        let content = PlanetView(uiSpin: ReactiveUISpin.makeWith(initialState: .loading(planet: planet)))
        return LazyView(content)
    }

    override func makePeopleView(with people: People) -> LazyView<PeopleView> {
        let content = PeopleView(uiSpin: RxUISpin.makeWith(initialState: .loading(people: people)))
        return LazyView(content)
    }

    override func makeStarshipView(with starship: Starship) -> LazyView<StarshipView> {
        let content = StarshipView(uiSpin: CombineUISpin.makeWith(initialState: .loading(starship: starship)))
        return LazyView(content)
    }
}
