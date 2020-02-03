//
//  PlanetsView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import ReactiveSwift
import Spin_ReactiveSwift
import SwiftUI

struct PlanetsView: View {

    @ObservedObject
    var context: ReactiveViewContext<PlanetsFeature.State, PlanetsFeature.Event>

    @EnvironmentObject
    var viewBuilder: ViewBuilder

    let disposeBag = CompositeDisposable()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // PLANETS LIST
                    List(self.context.state.planets) { viewItem in
                        NavigationLink(destination: self.viewBuilder.makePlanetView(with: viewItem.planet)) {
                            PlanetsRowView(planet: viewItem.planet, isFavorite: viewItem.isFavorite)
                        }
                    }
                    .id(self.context.state.id) // hack to avoid list animation
                    .disabled(self.context.state.isLoading)
                    .opacity(self.context.state.isLoading ? 0.0: 1.0)
                    .frame(height: UIScreen.main.bounds.height / 2)

                    // PREVIOUS AND NEXT BUTTONS
                    VStack {
                        Spacer()

                        HStack {
                            Button(action: {
                                self.context.emit(.loadPrevious)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Previous")
                                    Spacer()
                                }
                            }
                            .disabled(!self.context.state.hasPreviousPage)

                            Button(action: {
                                self.context.emit(.loadNext)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Next")
                                    Spacer()
                                }
                            }
                            .disabled(!self.context.state.hasNextPage)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .padding(0)
                ActivityIndicatorView(isLoading: self.context.state.isLoading, style: .large)
            }
            .navigationBarTitle("Planets")
            .onAppear {
                self.context.emit(.load)
            }
        }
    }
}

import Swinject

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsView(context: ReactiveViewContext(state: .idle))
            .environmentObject(PreviewViewBuilder(resolver: Assembler().resolver))
    }
}
