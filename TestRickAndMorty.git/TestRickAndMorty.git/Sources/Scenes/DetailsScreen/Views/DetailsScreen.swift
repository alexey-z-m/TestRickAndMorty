//
//  DetailsScreen.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import SwiftUI

struct DetailsScreen: View {
    @State private var isPresented = false

    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.02, green: 0.05, blue: 0.12)
                VStack {
                    HStack{
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .bold()
                        }
                        .fullScreenCover(isPresented: $isPresented, content: MainScreenView.init)
                        Spacer()
                    }
                    .padding(.leading, 24)
                    Spacer()
                }
                .padding(.top, 60)

                ScrollView {
                    MainDetails()
                    InfoDetails()
                    OriginDetails()
                    EpisodesDetails()
                }
                .padding(.top, 90)
            }
            .ignoresSafeArea()
        }
        .navigationTitle("<")
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}
