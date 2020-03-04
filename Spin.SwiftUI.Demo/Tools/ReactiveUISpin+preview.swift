//
//  ReactiveUISpin+initialState.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-02-09.
//  Copyright © 2020 Spinners. All rights reserved.
//

import ReactiveSwift
import Spin_ReactiveSwift

extension ReactiveSwiftUISpin {
    static func makeWith(initialState state: State) -> ReactiveSwiftUISpin<State, Event> {
        let feedback = ReactiveFeedback<State, Event>(effect: {(states: SignalProducer<State, Never>) -> SignalProducer<Event, Never> in
            return SignalProducer<Event, Never>.empty
        })
        let reducer = ReactiveReducer<State, Event>(reducer: {(state: State, event: Event) -> State in
            return state
        })
        let spin = ReactiveSpin<State, Event>(initialState: state, reducer: reducer) {
            feedback
        }

        return ReactiveSwiftUISpin(spin: spin)
    }
}
