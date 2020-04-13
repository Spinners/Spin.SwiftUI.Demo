//
//  PreviewViewBuilder.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-14.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SpinCombine
import SpinReactiveSwift
import SpinRxSwift

class PreviewViewBuilder: ViewBuilder {
    override func makePlanetsView() -> PlanetsView {
        return PlanetsView(uiSpin: ReactiveSwiftUISpin.makeWith(initialState: .idle))
    }

    override func makePeoplesView() -> PeoplesView {
        return PeoplesView(uiSpin: RxSwiftUISpin.makeWith(initialState: .idle))
    }

    override func makeStarshipsView() -> StarshipsView {
        return StarshipsView(uiSpin: CombineSwiftUISpin.makeWith(initialState: .idle))
    }

    override func makePlanetView(with planet: Planet) -> LazyView<PlanetView> {
        let content = PlanetView(uiSpin: ReactiveSwiftUISpin.makeWith(initialState: .loading(planet: planet)))
        return LazyView(content)
    }

    override func makePeopleView(with people: People) -> LazyView<PeopleView> {
        let content = PeopleView(uiSpin: RxSwiftUISpin.makeWith(initialState: .loading(people: people)))
        return LazyView(content)
    }

    override func makeStarshipView(with starship: Starship) -> LazyView<StarshipView> {
        let content = StarshipView(uiSpin: CombineSwiftUISpin.makeWith(initialState: .loading(starship: starship)))
        return LazyView(content)
    }
}
