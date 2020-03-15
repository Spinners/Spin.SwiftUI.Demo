//
//  CombineUISpin+preview.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-02-09.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import Spin_Combine

extension CombineSwiftUISpin {
    static func makeWith(initialState state: State) -> SwiftUISpin<State, Event> {
        let feedback = CombineFeedback<State, Event>(effect: {(states: AnyPublisher<State, Never>) -> AnyPublisher<Event, Never> in
            return Empty().eraseToAnyPublisher()
        })
        let reducer = CombineReducer<State, Event> { (state: State, event: Event) -> State in
            return state
        }
        let spin = CombineSpin<State, Event>(initialState: state, reducer: reducer) {
            feedback
        }

        return SwiftUISpin(spin: spin)
    }
}
