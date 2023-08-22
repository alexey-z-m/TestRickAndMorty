//
//  MainDetail.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import SwiftUI

struct MainDetails: View {
    @State var details: CharacterSchema? = Network.detailsCharacter
    var body: some View {
        AsyncImage(url: URL(string: details?.image ?? "")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 148,height: 148)
        .aspectRatio(contentMode:.fill)
        .clipped()
        .cornerRadius(16)
        .padding(.bottom, 24)
        Text(details?.name ?? "")
            .foregroundColor(.white)
            .bold()
            .font(.system(size: 22))
        Text(details?.status ?? "")
            .foregroundColor(.green)
            .padding(.top, 4)
    }
}

struct MainDetails_Previews: PreviewProvider {
    static var previews: some View {
        MainDetails()
    }
}
