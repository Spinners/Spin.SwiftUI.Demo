//
//  PeoplesView.swift
//  Spin.SwiftUI.Demo
//
//  Created by Thibault Wittemberg on 2020-01-02.
//  Copyright © 2020 Spinners. All rights reserved.
//

import RxSwift
import Spin_RxSwift
import SwiftUI

struct PeoplesView: View {

    @ObservedObject
    var context: RxViewContext<PeoplesFeature.State, PeoplesFeature.Event>

    @EnvironmentObject
    var viewBuilder: ViewBuilder

    let disposeBag = DisposeBag()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // PEOPLES LIST
                    List(self.context.state.peoples) { viewItem in
                        NavigationLink(destination: self.viewBuilder.makePeopleView(with: viewItem.people)) {
                            PeoplesRowView(people: viewItem.people, isFavorite: viewItem.isFavorite)
                        }
                    }
                    .id(self.context.state.id) // hack to avoid list animation
                    .disabled(self.context.state.isLoading)
                    .opacity(self.context.state.isLoading ? 0.0: 1.0)
                    .frame(height: UIScreen.main.bounds.height / 2)

                    // PREVIOUS AND NEXT BUTTONS
                    VStack {
                        HStack {
                            Button(action: {
                                self.context.emit(.loadPrevious)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Previous")
                                    Spacer()
                                }                    }
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
            .navigationBarTitle("Peoples")
            .onAppear {
                self.context.emit(.load)
            }
        }
    }
}

import Swinject

struct PeoplesView_Previews: PreviewProvider {
    static var previews: some View {
        PeoplesView(context: RxViewContext(state: .idle))
            .environmentObject(PreviewViewBuilder(resolver: Assembler().resolver))
    }
}
