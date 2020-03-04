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
    var uiSpin: RxSwiftUISpin<PeoplesFeature.State, PeoplesFeature.Event>
    
    @EnvironmentObject
    var viewBuilder: ViewBuilder
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // PEOPLES LIST
                    List(self.uiSpin.state.peoples) { viewItem in
                        NavigationLink(destination: self.viewBuilder.makePeopleView(with: viewItem.people)) {
                            PeoplesRowView(people: viewItem.people, isFavorite: viewItem.isFavorite)
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
            .navigationBarTitle("Peoples")
            .onAppear {
                self.uiSpin.emit(.load)
            }
        }
    }
}

import Swinject

struct PeoplesView_Previews: PreviewProvider {
    static var previews: some View {
        PeoplesView(uiSpin: RxSwiftUISpin.makeWith(initialState: .idle))
            .environmentObject(PreviewViewBuilder(resolver: Assembler().resolver))
    }
}
