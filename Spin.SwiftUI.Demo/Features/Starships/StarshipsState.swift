//
//  FilmsState.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-09-02.
//  Copyright © 2019 Spinners. All rights reserved.
//

extension StarshipsFeature {
    enum State {
        case idle
        case loading(page: Int? = nil)
        case loaded(data: [ViewItem], previousPage: Int?, nextPage: Int?)
        case failed

        struct ViewItem: Identifiable {
            let starship: Starship
            let isFavorite: Bool

            var id: String {
                self.starship.url
            }

            static let empty = ViewItem(starship: .empty,
                                        isFavorite: false)
        }
    }
}

extension StarshipsFeature.State {
    var isLoading: Bool {
        if case .loading(_) = self {
            return true
        }

        return false
    }

    var isFailed: Bool {
        if case .failed = self {
            return true
        }

        return false
    }

    var starships: [StarshipsFeature.State.ViewItem] {
        if case .loaded(let data, _, _) = self {
            return data
        }

        return []
    }

    var hasPreviousPage: Bool {
        if case .loaded(_, let previous, _) = self, previous != nil {
            return true
        }

        return false
    }

    var hasNextPage: Bool {
        if case .loaded(_, _, let next) = self, next != nil {
            return true
        }

        return false
    }
}
