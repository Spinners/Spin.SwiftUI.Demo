//
//  StarshipReducer.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension StarshipFeature {
    static func reducer(state: StarshipFeature.State, event: StarshipFeature.Event) -> StarshipFeature.State {
        switch (state, event) {
        case (.loading, .succeedLoad(let viewItem)):
            return .loaded(viewItem: viewItem)
        case (.enablingFavorite(let starship, let favorite), .succeedPersistFavorite):
            let newViewItem = StarshipFeature.State.ViewItem(starship: starship, isFavorite: favorite)
            return .loaded(viewItem: newViewItem)
        case (.loaded(let viewItem), .toggleFavorite):
            return .enablingFavorite(starship: viewItem.starship, favorite: !viewItem.isFavorite)
        case (_, .failLoad):
            return .failed
        default:
            return state
        }
    }
}
