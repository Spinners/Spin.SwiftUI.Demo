//
//  RxUISpin+preview.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-02-09.
//  Copyright © 2020 Spinners. All rights reserved.
//

import RxSwift
import Spin_RxSwift

extension RxUISpin {
    static func makeWith(initialState state: State) -> RxUISpin<State, Event> {
        let feedback = RxFeedback<State, Event>(effect: {(states: Observable<State>) -> Observable<Event> in
            return Observable<Event>.empty()
        })
        let reducer = RxReducer<State, Event>(reducer: {(state: State, event: Event) -> State in
            return state
        })
        let spin = RxSpin<State, Event>(initialState: state, reducer: reducer) {
            feedback
        }

        return RxUISpin(spin: spin)
    }
}
