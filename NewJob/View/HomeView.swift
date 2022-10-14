//
//  ContentView.swift
//  NewJob
//
//  Created by Pierre on 07/01/2022.
//

import SwiftUI

struct HomeView: View {
    @State var showUserView = false
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.indigo,.cyan,.mint, .green]), startPoint: .topTrailing, endPoint: .bottomLeading)
                        .ignoresSafeArea()
                    VStack {
//                        RoundedImage(imageName: "alternanceImage", height: geometry.size.height / 6, width: geometry.size.width / 3)
                        Spacer()
                        ThisWeekCard(selectedJobCount: viewModel.jobsCount, candidacySending: viewModel.jobsWithCandidacyMakeCount)
                            .environmentObject(viewModel)
                        Spacer()
//                        Divider()
                        HStack () {
                            NavigationLink(
                                destination: SearchJobView(),
                                label: {
                                    SquareCard(text: "Chercher", image: "magnifyingglass.circle.fill", size: geometry.size.width / 2.5)
                                }
                                
                            )
                            NavigationLink(
                                destination: RelaunchContactView(),
                                label: {
                                    SquareCard(text: "Relancer", image: "paperplane.circle.fill", size: geometry.size.width / 2.5)
                                }
                            )
                        }
                        HStack () {
                            NavigationLink(
                                destination: FavoriteJobOfferView(),
                                label: {
                                    SquareCard(text: "Mes annonces", image: "heart.circle.fill", size: geometry.size.width / 2.5)
                                }
                            )
                            NavigationLink(
                                destination: ContactView(),
                                label: {
                                    SquareCard(text: "Contacts", image: "book.circle.fill", size: geometry.size.width / 2.5)
                                }
                            )
                        }

                        Spacer()
                    }
                }
                
//                .navigationBarTitle(Text("Accueil"), displayMode:.large)
                .toolbar {
                    ToolbarItem(placement:.navigationBarTrailing) {
//                        NavigationLink(
//                            destination: UserView(),
//                            label: {
//                                Label("", systemImage: "person.circle")
//                                    .foregroundColor(.white)
//                                    .font(.title)
//                            }
//                        )
                    }
                }
                .onAppear(){
                    viewModel.updateData()
                }
            }
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .previewDevice("iPhone 13")
//            HomeView()
//                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
