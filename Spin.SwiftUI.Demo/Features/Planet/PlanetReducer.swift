//
//  PlanetReducer.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension PlanetFeature {
    static func reducer(state: PlanetFeature.State, event: PlanetFeature.Event) -> PlanetFeature.State {
        switch (state, event) {
        case (.loading, .succeedLoad(let viewItem)):
            return .loaded(viewItem: viewItem)
        case (.enablingFavorite(let planet, let favorite), .succeedPersistFavorite):
            let newViewItem = PlanetFeature.State.ViewItem(planet: planet, isFavorite: favorite)
            return .loaded(viewItem: newViewItem)
        case (.loaded(let viewItem), .toggleFavorite):
            return .enablingFavorite(planet: viewItem.planet, favorite: !viewItem.isFavorite)
        case (_, .failLoad):
            return .failed
        default:
            return state
        }
    }
}
