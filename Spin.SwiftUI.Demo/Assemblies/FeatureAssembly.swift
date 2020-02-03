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

        container.register(PlanetsView.self) { resolver -> PlanetsView in
            let initialState = PlanetsFeature.State.idle
            let loadFeedback = resolver.resolve(PlanetsFeedbackFunction.self)!
            let viewContext = ReactiveViewContext<PlanetsFeature.State, PlanetsFeature.Event>(state: initialState)
            let view = PlanetsView(context: viewContext)

            // build Spin with the builder pattern
            Spinner
                .from(initialState: initialState)
                .add(feedback: ReactiveFeedback(viewContext: viewContext))
                .add(feedback: ReactiveFeedback(effect: loadFeedback, on: QueueScheduler()))
                .reduce(with: ReactiveReducer(reducer: PlanetsFeature.reducer))
                .spin()
                .disposed(by: view.disposeBag)

            return view
        }

        container.register(PeoplesView.self) { resolver -> PeoplesView in
            let initialState = PeoplesFeature.State.idle
            let loadFeedback = resolver.resolve(PeoplesFeedbackFunction.self)!
            let viewContext = RxViewContext<PeoplesFeature.State, PeoplesFeature.Event>(state: initialState)
            let view = PeoplesView(context: viewContext)

            // build Spin with the builder pattern
            Spinner
                .from(initialState: initialState)
                .add(feedback: RxFeedback(viewContext: viewContext))
                .add(feedback: RxFeedback(effect: loadFeedback, on: SerialDispatchQueueScheduler(qos: .userInteractive)))
                .reduce(with: RxReducer(reducer: PeoplesFeature.reducer))
                .spin()
                .disposed(by: view.disposeBag)

            return view
        }

        container.register(StarshipsView.self) { resolver -> StarshipsView in
            let initialState = StarshipsFeature.State.idle
            let loadFeedback = resolver.resolve(StarshipsFeedbackFunction.self)!
            let viewContext = CombineViewContext<StarshipsFeature.State, StarshipsFeature.Event>(state: initialState)
            let feedbackScheduler = resolver.resolve(AnyScheduler<DispatchQueue.SchedulerTimeType, DispatchQueue.SchedulerOptions>.self)!
            var view = StarshipsView(context: viewContext)

            // build Spin with the builder pattern
            Spinner
                .from(initialState: initialState)
                .add(feedback: CombineFeedback(viewContext: viewContext))
                .add(feedback: CombineFeedback(effect: loadFeedback, on: feedbackScheduler))
                .reduce(with: CombineReducer(reducer: StarshipsFeature.reducer))
                .spin()
                .disposed(by: &view.disposeBag)

            return view
        }

        container.register(PlanetView.self) { (resolver, planet: Planet) -> PlanetView in
            let initialState = PlanetFeature.State.loading(planet: planet)
            let viewContext = ReactiveViewContext<PlanetFeature.State, PlanetFeature.Event>(state: initialState)
            let loadFavoriteFeedback = resolver.resolve(PlanetLoadFavoriteFeedbackFunction.self, name: "PlanetLoadFavoriteFeedbackFunction")!
            let persistFavoriteFeedback = resolver.resolve(PlanetPersistFavoriteFeedbackFunction.self, name: "PlanetPersistFavoriteFeedbackFunction")!
            let view = PlanetView(context: viewContext)

            // build Spin with declarative pattern
            ReactiveSpin(initialState: initialState,
                         reducer: ReactiveReducer(reducer: PlanetFeature.reducer)) {
                ReactiveFeedback(viewContext: viewContext)
                ReactiveFeedback(effect: loadFavoriteFeedback).execute(on: QueueScheduler())
                ReactiveFeedback(effect: persistFavoriteFeedback).execute(on: QueueScheduler())
            }
            .toReactiveStream()
            .spin()
            .disposed(by: view.disposeBag)

            return view
        }

        container.register(PeopleView.self) { (resolver, people: People) -> PeopleView in
            let initialState = PeopleFeature.State.loading(people: people)
            let viewContext = RxViewContext<PeopleFeature.State, PeopleFeature.Event>(state: initialState)
            let loadFavoriteFeedback = resolver.resolve(PeopleLoadFavoriteFeedbackFunction.self, name: "PeopleLoadFavoriteFeedbackFunction")!
            let persistFavoriteFeedback = resolver.resolve(PeoplePersistFavoriteFeedbackFunction.self, name: "PeoplePersistFavoriteFeedbackFunction")!
            let view = PeopleView(context: viewContext)

            // build Spin with declarative pattern
            RxSpin(initialState: initialState,
                   reducer: RxReducer(reducer: PeopleFeature.reducer)) {
                RxFeedback(viewContext: viewContext)
                RxFeedback(effect: loadFavoriteFeedback).execute(on: SerialDispatchQueueScheduler(qos: .userInteractive))
                RxFeedback(effect: persistFavoriteFeedback).execute(on: SerialDispatchQueueScheduler(qos: .userInteractive))
            }
            .toReactiveStream()
            .spin()
            .disposed(by: view.disposeBag)

            return view
        }

        container.register(StarshipView.self) { (resolver, starship: Starship) -> StarshipView in
            let initialState = StarshipFeature.State.loading(starship: starship)
            let viewContext = CombineViewContext<StarshipFeature.State, StarshipFeature.Event>(state: initialState)
            let loadFavoriteFeedback = resolver.resolve(StarshipLoadFavoriteFeedbackFunction.self, name: "StarshipLoadFavoriteFeedbackFunction")!
            let persistFavoriteFeedback = resolver.resolve(StarshipPersistFavoriteFeedbackFunction.self, name: "StarshipPersistFavoriteFeedbackFunction")!
            let feedbackScheduler = resolver.resolve(AnyScheduler<DispatchQueue.SchedulerTimeType, DispatchQueue.SchedulerOptions>.self)!

            var view = StarshipView(context: viewContext)

            // build Spin with declarative pattern
            CombineSpin(initialState: initialState,
                        reducer: CombineReducer(reducer: StarshipFeature.reducer)) {
                CombineFeedback(viewContext: viewContext)
                CombineFeedback(effect: loadFavoriteFeedback).execute(on: feedbackScheduler)
                CombineFeedback(effect: persistFavoriteFeedback).execute(on: feedbackScheduler)
            }
            .toReactiveStream()
            .spin()
            .disposed(by: &view.disposeBag)

            return view
        }
    }
}
