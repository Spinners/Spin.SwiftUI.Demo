//
//  FilmsState.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-09-02.
//  Copyright © 2019 Spinners. All rights reserved.
//

import Foundation

extension PlanetsFeature {

    enum State {
        case idle
        case loading(page: Int? = nil)
        case loaded(data: [ViewItem], currentPage: Int?, previousPage: Int?, nextPage: Int?)
        case failed

        struct ViewItem: Identifiable {
            let planet: Planet
            let isFavorite: Bool

            var id: String {
                self.planet.url
            }

            static let empty = ViewItem(planet: .empty,
                                        isFavorite: false)
        }
    }
}

extension PlanetsFeature.State {

    // hack to avoir list animations
    var id: String {
        switch self {
        case .loaded(let data, _, _, _):
            return data.map { $0.planet.url }.joined()
        default:
            return ""
        }
    }

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

    var planets: [PlanetsFeature.State.ViewItem] {
        if case .loaded(let data, _, _, _) = self {
            return data
        }

        return []
    }

    var hasPreviousPage: Bool {
        if case .loaded(_, _, let previous, _) = self, previous != nil {
            return true
        }

        return false
    }

    var hasNextPage: Bool {
        if case .loaded(_, _, _, let next) = self, next != nil {
            return true
        }

        return false
    }
}
