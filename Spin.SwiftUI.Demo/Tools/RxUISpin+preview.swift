//
//  RxUISpin+preview.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-02-09.
//  Copyright © 2020 Spinners. All rights reserved.
//

import RxSwift
import SpinCommon
import SpinRxSwift

extension RxSwiftUISpin {
    static func makeWith(initialState state: State) -> SwiftUISpin<State, Event> {
        let feedback = RxFeedback<State, Event>(effect: {(states: Observable<State>) -> Observable<Event> in
            return Observable<Event>.empty()
        })
        let reducer = Reducer<State, Event> ({ (state: State, event: Event) -> State in
            return state
        })
        let spin = RxSpin<State, Event>(initialState: state) {
            feedback
            reducer
        }

        return SwiftUISpin(spin: spin)
    }
}
