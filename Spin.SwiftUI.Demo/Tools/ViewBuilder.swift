//
//  ViewBuilder.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-14.
//  Copyright © 2020 Spinners. All rights reserved.
//

import SwiftUI
import Swinject

class ViewBuilder: ObservableObject {

    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func makePlanetsView() -> PlanetsView {
        let planetsView = self.resolver.resolve(PlanetsView.self)!
        return planetsView
    }

    func makePeoplesView() -> PeoplesView {
        let peoplesView = self.resolver.resolve(PeoplesView.self)!
        return peoplesView
    }

    func makeStarshipsView() -> StarshipsView {
        let starshipsView = self.resolver.resolve(StarshipsView.self)!
        return starshipsView
    }

    func makePlanetView(with planet: Planet) -> LazyView<PlanetView> {
        let planetView = LazyView(self.resolver.resolve(PlanetView.self, argument: planet)!)
        return planetView
    }

    func makePeopleView(with people: People) -> LazyView<PeopleView> {
        let peopleView = LazyView(self.resolver.resolve(PeopleView.self, argument: people)!)
        return peopleView
    }

    func makeStarshipView(with starship: Starship) -> LazyView<StarshipView> {
        let starshipView = LazyView(self.resolver.resolve(StarshipView.self, argument: starship)!)
        return starshipView
    }
}
