//
//  StarshipView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-06.
//  Copyright © 2020 Spinners. All rights reserved.
//

import Combine
import Spin_Combine
import SwiftUI

struct StarshipView: View {
    @ObservedObject
    var context: CombineViewContext<StarshipFeature.State, StarshipFeature.Event>

    var disposeBag = [AnyCancellable]()

    var body: some View {
        VStack {
            Text(self.context.state.starship.name)
                .fontWeight(.black)
            Form {
                LabelAndText(label: "Name", text: self.context.state.starship.name)
                LabelAndText(label: "Model", text: self.context.state.starship.model)
                LabelAndText(label: "Class", text: self.context.state.starship.starshipClass)
                LabelAndText(label: "Manufacturer", text: self.context.state.starship.manufacturer)
                LabelAndText(label: "Cost in credits", text: self.context.state.starship.costInCredits)
                LabelAndText(label: "Length", text: self.context.state.starship.length)
                LabelAndText(label: "Crew", text: self.context.state.starship.crew)
                LabelAndToggle(label: "Favorite",
                               isSelected: self.context.binding(for: \.isFavorite, event: { _ in .toggleFavorite }),
                               isLoading: self.context.state.isEnablingFavorite)
            }
        }
    }
}

struct StarshipView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipView(context: CombineViewContext(state: .loading(starship: .empty)))
    }
}
