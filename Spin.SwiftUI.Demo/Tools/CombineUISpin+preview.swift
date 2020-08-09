//
//  CombineUISpin+preview.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-02-09.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import SpinCombine
import SpinCommon

extension CombineSwiftUISpin {
    static func makeWith(initialState state: State) -> SwiftUISpin<State, Event> {
        let feedback = CombineFeedback<State, Event>(effect: {(states: AnyPublisher<State, Never>) -> AnyPublisher<Event, Never> in
            return Empty().eraseToAnyPublisher()
        })
        let reducer = Reducer<State, Event> { (state: State, event: Event) -> State in
            return state
        }
        let spin = CombineSpin<State, Event>(initialState: state) {
            feedback
            reducer
        }

        return SwiftUISpin(spin: spin)
    }
}
