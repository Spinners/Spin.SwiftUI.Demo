//
//  PlanetsView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import ReactiveSwift
import SpinReactiveSwift
import SwiftUI

struct PlanetsView: View {

    @ObservedObject
    var uiSpin: SwiftUISpin<PlanetsFeature.State, PlanetsFeature.Event>

    @EnvironmentObject
    var viewBuilder: ViewBuilder

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // PLANETS LIST
                    List(self.uiSpin.state.planets) { viewItem in
                        NavigationLink(destination: self.viewBuilder.makePlanetView(with: viewItem.planet)) {
                            PlanetsRowView(planet: viewItem.planet, isFavorite: viewItem.isFavorite)
                        }
                    }
                    .id(self.uiSpin.state.id) // hack to avoid list animation
                    .disabled(self.uiSpin.state.isLoading)
                    .opacity(self.uiSpin.state.isLoading ? 0.0: 1.0)
                    .frame(height: UIScreen.main.bounds.height / 2)

                    // PREVIOUS AND NEXT BUTTONS
                    VStack {
                        Spacer()

                        HStack {
                            Button(action: {
                                self.uiSpin.emit(.loadPrevious)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Previous")
                                    Spacer()
                                }
                            }
                            .disabled(!self.uiSpin.state.hasPreviousPage)

                            Button(action: {
                                self.uiSpin.emit(.loadNext)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Next")
                                    Spacer()
                                }
                            }
                            .disabled(!self.uiSpin.state.hasNextPage)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .padding(0)
                ActivityIndicatorView(isLoading: self.uiSpin.state.isLoading, style: .large)
            }
            .navigationBarTitle("Planets")
            .onAppear {
                self.uiSpin.emit(.load)
            }
        }
    }
}

import Swinject

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsView(uiSpin: ReactiveSwiftUISpin.makeWith(initialState: .idle))
            .environmentObject(PreviewViewBuilder(resolver: Assembler().resolver))
    }
}
