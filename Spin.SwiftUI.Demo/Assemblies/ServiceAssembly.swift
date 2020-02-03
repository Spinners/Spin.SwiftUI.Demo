//
//  ServiceAssembly.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-12-19.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

import Dispatch
import Foundation
import Spin_Combine
import Swinject

final class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FavoriteService.self, factory: { _ in
            FavoriteService()
        }).inObjectScope(.container)

        container.register(NetworkService.self) { _ in
            ReactiveNetworkService()
        }

        container.register(String.self, name: "baseURL") { _  in
            "swapi.co"
        }

        container.register(AnyScheduler<DispatchQueue.SchedulerTimeType, DispatchQueue.SchedulerOptions>.self) { _ -> AnyScheduler<DispatchQueue.SchedulerTimeType, DispatchQueue.SchedulerOptions> in
            return DispatchQueue(label: "feedback_queue_\(UUID().uuidString)", qos: .userInteractive).eraseToAnyScheduler()
        }
    }
}
