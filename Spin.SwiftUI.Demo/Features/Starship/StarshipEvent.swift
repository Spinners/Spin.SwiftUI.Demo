//
//  StarshipEvent.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension StarshipFeature {
    enum Event {
        case failLoad
        case succeedLoad(viewItem: StarshipFeature.State.ViewItem)
        case succeedPersistFavorite
        case toggleFavorite
    }
}
