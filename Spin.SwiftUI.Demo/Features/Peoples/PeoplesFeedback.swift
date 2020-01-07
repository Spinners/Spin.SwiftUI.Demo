//
//  PeoplesFeedback.swift
//  FeedbackLoopDemo
//
//  Created by Thibault Wittemberg on 2019-11-17.
//  Copyright © 2019 WarpFactor. All rights reserved.
//
import RxSwift

enum PeoplesFeature {
}

extension PeoplesFeature {
    enum FeedbackFunctions {

        /////////////////////////////////////////////
        // Loads a page when the state is .loading
        /////////////////////////////////////////////

        static func loadPage(loadEntityFunction: (Int?) -> Single<([(People, Bool)], Int?, Int?)>,
                             state: PeoplesFeature.State) -> Observable<PeoplesFeature.Action> {
            guard case let .loading(page) = state else { return .empty() }

            return loadEntityFunction(page)
                .map {
                    let viewItems = $0.0.map { PeoplesFeature.State.ViewItem(title: $0.0.name, isFavorite: $0.1) }
                    return .succeedLoad(peoples: viewItems, previousPage: $0.1, nextPage: $0.2)
            }
            .catchErrorJustReturn(.failLoad)
            .asObservable()
        }
    }
}
