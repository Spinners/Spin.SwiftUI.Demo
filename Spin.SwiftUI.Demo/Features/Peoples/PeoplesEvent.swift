//
//  PeoplesEvent.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-09-02.
//  Copyright © 2019 Spinners. All rights reserved.
//

extension PeoplesFeature {
    enum Event {
        case load
        case loadPrevious
        case loadNext
        case succeedLoad(peoples: [PeoplesFeature.State.ViewItem], currentPage: Int?, previousPage: Int?, nextPage: Int?)
        case failLoad
    }
}
