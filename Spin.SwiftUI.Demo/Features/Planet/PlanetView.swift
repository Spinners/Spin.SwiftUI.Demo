//
//  PlanetView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-05.
//  Copyright © 2020 Spinners. All rights reserved.
//

import ReactiveSwift
import Spin_ReactiveSwift
import SwiftUI

struct PlanetView: View {

    @ObservedObject
    var context: ReactiveViewContext<PlanetFeature.State, PlanetFeature.Event>

    let disposeBag = CompositeDisposable()

    var body: some View {
        VStack {
            Text(self.context.state.planet.name)
                .fontWeight(.black)
            Form {
                LabelAndText(label: "Diameter", text: self.context.state.planet.diameter)
                LabelAndText(label: "Population", text: self.context.state.planet.population)
                LabelAndText(label: "Gravity", text: self.context.state.planet.gravity)
                LabelAndText(label: "Orbital period", text: self.context.state.planet.orbitalPeriod)
                LabelAndText(label: "Rotation period", text: self.context.state.planet.rotationPeriod)
                LabelAndText(label: "Climate", text: self.context.state.planet.climate)
                LabelAndToggle(label: "Favorite",
                               isSelected: self.context.binding(for: \.isFavorite, event: { _ in .toggleFavorite }),
                               isLoading: self.context.state.isEnablingFavorite)
            }
        }
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(context: ReactiveViewContext(state: .loading(planet: .empty)))
    }
}
