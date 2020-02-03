//
//  PlanetsFeedback.swift
//  Spin.SwiftUI.Demo
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
                             state: PlanetsFeature.State) -> SignalProducer<PlanetsFeature.Event, Never> {
            guard case let .loading(page) = state else { return .empty }

            return loadEntityFunction(page)
                .map {
                    let viewItems = $0.0.map { PlanetsFeature.State.ViewItem(planet: $0.0, isFavorite: $0.1) }
                    return .succeedLoad(planets: viewItems,
                                        currentPage: page,
                                        previousPage: $0.1,
                                        nextPage: $0.2)

            }
                .flatMapError { (error) -> SignalProducer<PlanetsFeature.Event, Never> in
                    return SignalProducer<PlanetsFeature.Event, Never>(value: .failLoad)
            }
        }
    }
}
