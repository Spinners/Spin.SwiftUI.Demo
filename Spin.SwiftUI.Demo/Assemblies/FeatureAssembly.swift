//
//  FeatureAssembly.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import ReactiveSwift
import RxSwift
import Spin_Combine
import Spin_ReactiveSwift
import Spin_RxSwift
import Spin_Swift
import SwiftUI
import Swinject

final class FeatureAssembly: Assembly {
    func assemble(container: Container) {
        ////////////////////////////////////
        // PLANETS LIST SPIN
        ////////////////////////////////////
        container.register(PlanetsView.self) { resolver -> PlanetsView in
            let planetsSpin = resolver.resolve(ReactiveSpin<PlanetsFeature.State, PlanetsFeature.Event>.self)!
            let planetsUISpin = ReactiveSwiftUISpin(spin: planetsSpin)
            let view = PlanetsView(uiSpin: planetsUISpin)
            planetsUISpin.start()
            return view
        }

        ////////////////////////////////////
        // PEOPLES LIST SPIN
        ////////////////////////////////////
        container.register(PeoplesView.self) { resolver -> PeoplesView in
            let peoplesSpin = resolver.resolve(RxSpin<PeoplesFeature.State, PeoplesFeature.Event>.self)!
            let peoplesUISpin = RxSwiftUISpin(spin: peoplesSpin)
            let view = PeoplesView(uiSpin: peoplesUISpin)
            peoplesUISpin.start()
            return view
        }

        ////////////////////////////////////
        // STARSHIPS LIST SPIN
        ////////////////////////////////////
        container.register(StarshipsView.self) { resolver -> StarshipsView in
            let starshipsSpin = resolver.resolve(CombineSpin<StarshipsFeature.State, StarshipsFeature.Event>.self)!
            let starshipsUISpin = CombineSwiftUISpin(spin: starshipsSpin)
            let view = StarshipsView(uiSpin: starshipsUISpin)
            starshipsUISpin.start()
            return view
        }

        container.register(PlanetView.self) { (resolver, planet: Planet) -> PlanetView in
            let planetSpin = resolver.resolve(ReactiveSpin<PlanetFeature.State, PlanetFeature.Event>.self, argument: planet)!
            let planetUISpin = ReactiveSwiftUISpin(spin: planetSpin)
            let view = PlanetView(uiSpin: planetUISpin)
            planetUISpin.start()
            return view
        }

        container.register(PeopleView.self) { (resolver, people: People) -> PeopleView in
            let peopleSpin = resolver.resolve(RxSpin<PeopleFeature.State, PeopleFeature.Event>.self, argument: people)!
            let peopleUISpin = RxSwiftUISpin(spin: peopleSpin)
            let view = PeopleView(uiSpin: peopleUISpin)
            peopleUISpin.start()
            return view
        }

        container.register(StarshipView.self) { (resolver, starship: Starship) -> StarshipView in
            let starshipSpin = resolver.resolve(CombineSpin<StarshipFeature.State, StarshipFeature.Event>.self, argument: starship)!
            let starshipUISpin = CombineSwiftUISpin(spin: starshipSpin)
            let view = StarshipView(uiSpin: starshipUISpin)
            starshipUISpin.start()
            return view
        }
    }
}
