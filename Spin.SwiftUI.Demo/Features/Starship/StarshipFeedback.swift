//
//  StarshipFeedback.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//
import Combine

enum StarshipFeature {
}

extension StarshipFeature {
    enum FeedbackFunctions {

        /////////////////////////////////////////////
        // Loads a Starship and its favorite property when the state is .loading
        /////////////////////////////////////////////
        static func load(loadFavoriteFunction: (String) -> Bool,
                         state: StarshipFeature.State) -> AnyPublisher<StarshipFeature.Event, Never> {
            guard case let .loading(starship) = state else { return Empty().eraseToAnyPublisher() }

            let isFavorite = loadFavoriteFunction(starship.url)
            let viewItem = StarshipFeature.State.ViewItem(starship: starship, isFavorite: isFavorite)
            return Just<StarshipFeature.Event>(.succeedLoad(viewItem: viewItem)).eraseToAnyPublisher()
        }
        
        /////////////////////////////////////////////
        // Persist a favorite property when the state is .enablingFavorite
        /////////////////////////////////////////////
        static func persist(persistFavoriteFunction: (Bool, String) -> Void,
                            state: StarshipFeature.State) -> AnyPublisher<StarshipFeature.Event, Never> {
            print("persist with state \(state)")

            guard case let .enablingFavorite(starship, favorite) = state else { return Empty().eraseToAnyPublisher() }

            persistFavoriteFunction(favorite, starship.url)
            return Just<StarshipFeature.Event>(.succeedPersistFavorite).eraseToAnyPublisher()
        }
    }
}
