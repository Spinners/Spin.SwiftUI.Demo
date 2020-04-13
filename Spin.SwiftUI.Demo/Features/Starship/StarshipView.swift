//
//  StarshipView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-06.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import SpinCombine
import SwiftUI

struct StarshipView: View {
    @ObservedObject
    var uiSpin: SwiftUISpin<StarshipFeature.State, StarshipFeature.Event>

    var body: some View {
        Form {
            LabelAndText(label: "Name", text: self.uiSpin.state.starship.name)
            LabelAndText(label: "Model", text: self.uiSpin.state.starship.model)
            LabelAndText(label: "Class", text: self.uiSpin.state.starship.starshipClass)
            LabelAndText(label: "Manufacturer", text: self.uiSpin.state.starship.manufacturer)
            LabelAndText(label: "Cost in credits", text: self.uiSpin.state.starship.costInCredits)
            LabelAndText(label: "Length", text: self.uiSpin.state.starship.length)
            LabelAndText(label: "Crew", text: self.uiSpin.state.starship.crew)
            LabelAndToggle(label: "Favorite",
                           isSelected: self.uiSpin.binding(for: \.isFavorite, event: { _ in .toggleFavorite }),
                           isLoading: self.uiSpin.state.isEnablingFavorite)
        }
        .navigationBarTitle("\(self.uiSpin.state.starship.name)", displayMode: .inline)
    }
}

struct StarshipView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipView(uiSpin: CombineSwiftUISpin.makeWith(initialState: .loading(starship: .empty)))
    }
}
