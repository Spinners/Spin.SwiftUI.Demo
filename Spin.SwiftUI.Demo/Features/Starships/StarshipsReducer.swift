//
//  PlanetsReducer.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-09-02.
//  Copyright © 2019 Spinners. All rights reserved.
//

extension StarshipsFeature {
    static func reducer(state: StarshipsFeature.State, event: StarshipsFeature.Event) -> StarshipsFeature.State {
        switch (state, event) {
        case (_, .failLoad):
            return .failed
        case (_, .load):
            return .loading(page: nil)
        case (.loaded(_, let previousPage, _), .loadPrevious) where previousPage != nil:
            return .loading(page: previousPage)
        case (.loaded(_, _, let nextPage), .loadNext) where nextPage != nil:
            return .loading(page: nextPage)
        case (_, .succeedLoad(let viewItems, let previousPage, let nextPage)):
            return .loaded(data: viewItems, previousPage: previousPage, nextPage: nextPage)
        default:
            return state
        }
    }
}
