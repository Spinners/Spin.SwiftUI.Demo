//
//  PlanetFeedback.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//
import ReactiveSwift

enum PlanetFeature {
}

extension PlanetFeature {
    enum FeedbackFunctions {

        /////////////////////////////////////////////
        // Loads a planet and its favorite property when the state is .loading
        /////////////////////////////////////////////
        static func load(loadFavoriteFunction: (String) -> Bool,
                         state: PlanetFeature.State) -> SignalProducer<PlanetFeature.Event, Never> {
            guard case let .loading(planet) = state else { return .empty }

            let isFavorite = loadFavoriteFunction(planet.url)
            let viewItem = PlanetFeature.State.ViewItem(planet: planet, isFavorite: isFavorite)
            return SignalProducer<PlanetFeature.Event, Never>(value: .succeedLoad(viewItem: viewItem))
        }

        /////////////////////////////////////////////
        // Persist a favorite property when the state is .enablingFavorite
        /////////////////////////////////////////////
        static func persist(persistFavoriteFunction: (Bool, String) -> Void,
                            state: PlanetFeature.State) -> SignalProducer<PlanetFeature.Event, Never> {
            guard case let .enablingFavorite(planet, favorite) = state else { return .empty }
            
            persistFavoriteFunction(favorite, planet.url)
            return SignalProducer<PlanetFeature.Event, Never>(value: .succeedPersistFavorite)
        }
    }
}
