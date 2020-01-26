//
//  PlanetEvent.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension PlanetFeature {
    enum Event {
        case failLoad
        case succeedLoad(viewItem: PlanetFeature.State.ViewItem)
        case succeedPersistFavorite
        case toggleFavorite
    }
}
