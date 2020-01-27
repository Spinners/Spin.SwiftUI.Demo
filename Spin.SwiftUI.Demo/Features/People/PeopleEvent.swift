//
//  PeopleEvent.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-24.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

extension PeopleFeature {
    enum Event {
        case failLoad
        case succeedLoad(viewItem: PeopleFeature.State.ViewItem)
        case succeedPersistFavorite
        case toggleFavorite
    }
}
