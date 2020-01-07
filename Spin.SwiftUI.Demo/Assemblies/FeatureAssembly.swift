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

        container.register(AppView.self) { resolver -> AppView in
            let planetsView = resolver.resolve(PlanetsView.self)!
            let peoplesView = resolver.resolve(PeoplesView.self)!
            let starshipsView = resolver.resolve(StarshipsView.self)!

            return AppView(planetsView: planetsView, peoplesView: peoplesView, starshipsView: starshipsView)
        }

        container.register(PlanetsView.self) { resolver -> PlanetsView in
            let initialState = PlanetsFeature.State.idle
            let loadFeedback = resolver.resolve(PlanetsFeedbackFunction.self)!
            let viewContext = ReactiveViewContext<PlanetsFeature.State, PlanetsFeature.Action>(state: initialState)
            let view = PlanetsView(context: viewContext)

            // build Spin with the builder pattern
            Spinner
                .from(initialState: initialState)
                .add(feedback: viewContext.toFeedback())
                .add(feedback: ReactiveFeedback(feedback: loadFeedback, on: QueueScheduler()))
                .reduce(with: ReactiveReducer(reducer: PlanetsFeature.reducer))
                .spin()
                .disposed(by: view.disposeBag)

            return view
        }

        container.register(PeoplesView.self) { resolver -> PeoplesView in
            let initialState = PeoplesFeature.State.idle
            let loadFeedback = resolver.resolve(PeoplesFeedbackFunction.self)!
            let viewContext = RxViewContext<PeoplesFeature.State, PeoplesFeature.Action>(state: initialState)
            let view = PeoplesView(context: viewContext)

            // build Spin with the builder pattern
            Spinner
                .from(initialState: initialState)
                .add(feedback: viewContext.toFeedback())
                .add(feedback: RxFeedback(feedback: loadFeedback, on: SerialDispatchQueueScheduler(qos: .userInteractive)))
                .reduce(with: RxReducer(reducer: PeoplesFeature.reducer))
                .spin()
                .disposed(by: view.disposeBag)

            return view
        }

        container.register(StarshipsView.self) { resolver -> StarshipsView in
            let initialState = StarshipsFeature.State.idle
            let loadFeedback = resolver.resolve(StarshipsFeedbackFunction.self)!
            let viewContext = CombineViewContext<StarshipsFeature.State, StarshipsFeature.Action>(state: initialState)
            let feedbackScheduler = resolver.resolve(AnyScheduler<DispatchQueue.SchedulerTimeType, DispatchQueue.SchedulerOptions>.self)!
            var view = StarshipsView(context: viewContext)

            // build Spin with the builder pattern
            Spinner
                .from(initialState: initialState)
                .add(feedback: viewContext.toFeedback())
                .add(feedback: CombineFeedback(feedback: loadFeedback, on: feedbackScheduler))
                .reduce(with: CombineReducer(reducer: StarshipsFeature.reducer))
                .spin()
                .disposed(by: &view.disposeBag)

            return view
        }
    }
}
