//
//  CombineUISpin+preview.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-02-09.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import Spin_Combine

extension CombineUISpin {
    static func makeWith(initialState state: State) -> CombineUISpin<State, Event> {
        let feedback = CombineFeedback<State, Event>(effect: {(states: AnyPublisher<State, Never>) -> AnyPublisher<Event, Never> in
            return Empty().eraseToAnyPublisher()
        })
        let reducer = CombineReducer<State, Event>(reducer: {(state: State, event: Event) -> State in
            return state
        })
        let spin = CombineSpin<State, Event>(initialState: state, reducer: reducer) {
            feedback
        }

        return CombineUISpin(spin: spin)
    }
}
