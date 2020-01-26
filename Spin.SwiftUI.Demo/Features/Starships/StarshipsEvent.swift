//
//  StarshipsEvent.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-09-02.
//  Copyright © 2019 Spinners. All rights reserved.
//

extension StarshipsFeature {
    enum Event {
        case load
        case loadPrevious
        case loadNext
        case succeedLoad(starships: [StarshipsFeature.State.ViewItem], previousPage: Int?, nextPage: Int?)
        case failLoad
    }
}
