//
//  PlanetView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-05.
//  Copyright © 2020 Spinners. All rights reserved.
//

import ReactiveSwift
import SpinReactiveSwift
import SwiftUI

struct PlanetView: View {

    @ObservedObject
    var uiSpin: SwiftUISpin<PlanetFeature.State, PlanetFeature.Event>

    var body: some View {
        Form {
            LabelAndText(label: "Diameter", text: self.uiSpin.state.planet.diameter)
            LabelAndText(label: "Population", text: self.uiSpin.state.planet.population)
            LabelAndText(label: "Gravity", text: self.uiSpin.state.planet.gravity)
            LabelAndText(label: "Orbital period", text: self.uiSpin.state.planet.orbitalPeriod)
            LabelAndText(label: "Rotation period", text: self.uiSpin.state.planet.rotationPeriod)
            LabelAndText(label: "Climate", text: self.uiSpin.state.planet.climate)
            LabelAndToggle(label: "Favorite",
                           isSelected: self.uiSpin.binding(for: \.isFavorite, event: { _ in .toggleFavorite }),
                           isLoading: self.uiSpin.state.isEnablingFavorite)
        }
        .navigationBarTitle("\(self.uiSpin.state.planet.name)", displayMode: .inline)
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(uiSpin: ReactiveSwiftUISpin.makeWith(initialState: .loading(planet: .empty)))
    }
}
