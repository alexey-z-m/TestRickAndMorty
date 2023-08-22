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
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}
