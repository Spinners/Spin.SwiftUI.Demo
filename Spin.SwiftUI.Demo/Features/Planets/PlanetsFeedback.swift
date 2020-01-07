//
//  PlanetsFeedback.swift
//  FeedbackLoopDemo
//
//  Created by Thibault Wittemberg on 2019-11-17.
//  Copyright © 2019 WarpFactor. All rights reserved.
//
import ReactiveSwift

enum PlanetsFeature {
}

extension PlanetsFeature {
    enum FeedbackFunctions {
        
        /////////////////////////////////////////////
        // Loads a page when the state is .loading
        /////////////////////////////////////////////
        static func loadPage(loadEntityFunction: (Int?) -> SignalProducer<([(Planet, Bool)], Int?, Int?), NetworkError>,
                             state: PlanetsFeature.State) -> SignalProducer<PlanetsFeature.Action, Never> {
            print("--- STATE RECEIVED IN FEEDBACK: \(state)")
            guard case let .loading(page) = state else { return .empty }

            return loadEntityFunction(page)
                .map {
                    print("LOADED PLANETS: \($0.0)")
                    let viewItems = $0.0.map { PlanetsFeature.State.ViewItem(title: $0.0.name, isFavorite: $0.1) }
                    return .succeedLoad(planets: viewItems,
                                        previousPage: $0.1,
                                        nextPage: $0.2)

            }
                .flatMapError { (error) -> SignalProducer<PlanetsFeature.Action, Never> in
                    return SignalProducer<PlanetsFeature.Action, Never>(value: .failLoad)
            }
        }
    }
}
