//
//  ServiceAssembly.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2019-12-19.
//  Copyright © 2019 WarpFactor. All rights reserved.
//

import Dispatch
import Foundation
import SpinCombine
import Swinject

final class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FavoriteService.self, factory: { _ in
            return FavoriteService()
        }).inObjectScope(.transient)

        container.register(NetworkService.self) { _ in
            return ReactiveNetworkService()
        }

        container.register(String.self, name: "baseURL") { _  in
            return "api.giphy.com"
        }

        container.register(String.self, name: "apiKey") { _  in
            return "f4HXQOslkXuDXgFlZQATpWXc8FtjhuUR"
        }
    }
}
