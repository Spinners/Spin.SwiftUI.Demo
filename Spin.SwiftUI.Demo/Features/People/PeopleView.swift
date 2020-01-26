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
    var context: RxViewContext<PeopleFeature.State, PeopleFeature.Event>

    let disposeBag = DisposeBag()

    var body: some View {
        VStack {
            Text(self.context.state.people.name)
                .fontWeight(.black)
            Form {
                LabelAndText(label: "Name", text: self.context.state.people.name)
                LabelAndText(label: "Gender", text: self.context.state.people.gender)
                LabelAndText(label: "Eye Color", text: self.context.state.people.eyeColor)
                LabelAndText(label: "Skin Color", text: self.context.state.people.skinColor)
                LabelAndText(label: "Mass", text: self.context.state.people.mass)
                LabelAndText(label: "Height", text: self.context.state.people.height)
                LabelAndText(label: "Hair Color", text: self.context.state.people.hairColor)
                LabelAndToggle(label: "Favorite",
                               isSelected: self.context.binding(for: \.isFavorite, event: { _ in .toggleFavorite }),
                               isLoading: self.context.state.isEnablingFavorite)
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(context: RxViewContext(state: .loading(people: .empty)))
    }
}
