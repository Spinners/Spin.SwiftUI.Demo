//
//  PeopleReducer.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension PeopleFeature {
    static func reducer(state: PeopleFeature.State, event: PeopleFeature.Event) -> PeopleFeature.State {
        switch (state, event) {
        case (.loading, .succeedLoad(let viewItem)):
            return .loaded(viewItem: viewItem)
        case (.enablingFavorite(let people, let favorite), .succeedPersistFavorite):
            let newViewItem = PeopleFeature.State.ViewItem(people: people, isFavorite: favorite)
            return .loaded(viewItem: newViewItem)
        case (.loaded(let viewItem), .toggleFavorite):
            return .enablingFavorite(people: viewItem.people, favorite: !viewItem.isFavorite)
        case (_, .failLoad):
            return .failed
        default:
            return state
        }
    }
}
