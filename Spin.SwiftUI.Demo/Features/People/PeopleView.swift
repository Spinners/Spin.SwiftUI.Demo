//
//  PeopleView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-05.
//  Copyright © 2020 Spinners. All rights reserved.
//

import RxSwift
import Spin_RxSwift
import SwiftUI

struct PeopleView: View {
    @ObservedObject
    var uiSpin: RxUISpin<PeopleFeature.State, PeopleFeature.Event>

    var body: some View {
        Form {
            LabelAndText(label: "Name", text: self.uiSpin.state.people.name)
            LabelAndText(label: "Gender", text: self.uiSpin.state.people.gender)
            LabelAndText(label: "Eye Color", text: self.uiSpin.state.people.eyeColor)
            LabelAndText(label: "Skin Color", text: self.uiSpin.state.people.skinColor)
            LabelAndText(label: "Mass", text: self.uiSpin.state.people.mass)
            LabelAndText(label: "Height", text: self.uiSpin.state.people.height)
            LabelAndText(label: "Hair Color", text: self.uiSpin.state.people.hairColor)
            LabelAndToggle(label: "Favorite",
                           isSelected: self.uiSpin.binding(for: \.isFavorite, event: { _ in .toggleFavorite }),
                           isLoading: self.uiSpin.state.isEnablingFavorite)
        }
        .navigationBarTitle("\(self.uiSpin.state.people.name)", displayMode: .inline)
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(uiSpin: RxUISpin.makeWith(initialState: .loading(people: .empty)))
    }
}
