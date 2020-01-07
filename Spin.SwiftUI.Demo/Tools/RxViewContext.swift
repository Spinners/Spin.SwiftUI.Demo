//
//  RxViewContext.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import RxRelay
import RxSwift
import Spin_RxSwift

class RxViewContext<State, Mutation>: ObservableObject {
    @Published
    var state: State

    private let mutations = PublishRelay<Mutation>()

    init(state: State) {
        self.state = state
    }

    func send(mutation: Mutation) {
        self.mutations.accept(mutation)
    }

    func toFeedback() -> RxFeedback<State, Mutation> {
        let renderFeedbackFunction: (State) -> Void = { state in
            self.state = state
        }

        let mutationFeedbackFunction: () -> Observable<Mutation> = { () in
            return self.mutations.asObservable()
        }

        return RxFeedback(uiFeedbacks: renderFeedbackFunction,
                          mutationFeedbackFunction,
                          on: MainScheduler.instance)
    }
}
