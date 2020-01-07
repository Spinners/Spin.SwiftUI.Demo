//
//  CombineViewContext.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import Dispatch
import Spin_Combine

class CombineViewContext<State, Mutation>: ObservableObject {

    @Published
    var state: State

    private let mutations = PassthroughSubject<Mutation, Never>()

    init(state: State) {
        self.state = state
    }

    func send(mutation: Mutation) {
        self.mutations.send(mutation)
    }

    func toFeedback() -> DispatchQueueCombineFeedback<State, Mutation> {
        let renderFeedbackFunction: (State) -> Void = { state in
            self.state = state
        }

        let mutationFeedbackFunction: () -> AnyPublisher<Mutation, Never> = { () in
            return self.mutations.eraseToAnyPublisher()
        }

        return DispatchQueueCombineFeedback(uiFeedbacks: renderFeedbackFunction,
                                            mutationFeedbackFunction,
                                            on: DispatchQueue.main.eraseToAnyScheduler())
    }
}
