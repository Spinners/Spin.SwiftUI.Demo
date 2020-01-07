//
//  ReactiveViewContext.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import ReactiveSwift
import Spin_ReactiveSwift

class ReactiveViewContext<State, Mutation>: ObservableObject {
    @Published
    var state: State

    private let (mutationsProducer, mutationsObserver) = Signal<Mutation, Never>.pipe()

    init(state: State) {
        self.state = state
    }

    func send(mutation: Mutation) {
        self.mutationsObserver.send(value: mutation)
    }

    func toFeedback() -> ReactiveFeedback<State, Mutation> {
        let renderFeedbackFunction: (State) -> Void = { state in
            self.state = state
        }

        let mutationFeedbackFunction: () -> SignalProducer<Mutation, Never> = { () in
            return self.mutationsProducer.producer
        }

        return ReactiveFeedback(uiFeedbacks: renderFeedbackFunction,
                                mutationFeedbackFunction,
                                on: UIScheduler())
    }
}
