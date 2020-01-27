//
//  PeoplesApi.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-11-23.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

import RxSwift

enum Peoples {
}

extension Peoples {
    enum Apis {
        static func load(baseUrl: String, networkService: NetworkService, page: Int?) -> Single<ListResponse<People>> {
            let route = Route<ListEndpoint<People>>(baseUrl: baseUrl, endpoint: ListEndpoint<People>(path: PeoplesPath.peoples))
            if let page = page {
                route.set(parameter: ListRequest(page: page))
            }

            return networkService.fetchRx(route: route)
        }
    }
}
