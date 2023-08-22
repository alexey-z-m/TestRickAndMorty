//
//  InfoDetails.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import SwiftUI

struct InfoDetails: View {
    @State var details: CharacterSchema? = Network.detailsCharacter
    var body: some View {
        HStack {
            Text("Info")
                .foregroundColor(.white)
                .font(.system(size: 17))
                .bold()

            Spacer()
        }
        .padding([.leading, .trailing, .top], 24)
        ZStack {
            Rectangle()
                .cornerRadius(16)
                .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.22))
                .padding([.leading, .trailing], 24)
            VStack(spacing: 16) {
                HStack {
                    Text("Species:")
                        .foregroundColor(Color(red: 0.77, green: 0.79, blue: 0.81))
                        .font(.system(size: 16)
                            .weight(.medium))
                    Spacer()
                    Text(details?.species ?? "-")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                }
                .padding([.trailing,.leading, .top], 16)
                HStack {
                    Text("Type:")
                        .foregroundColor(Color(red: 0.77, green: 0.79, blue: 0.81))
                        .font(.system(size: 16)
                            .weight(.medium))
                    Spacer()
                    Text(details?.type == "" ? "None" : details?.type ?? "-")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                }

                .padding([.trailing,.leading], 16)
                HStack {
                    Text("Gender:")
                        .foregroundColor(Color(red: 0.77, green: 0.79, blue: 0.81))
                        .font(.system(size: 16)
                            .weight(.medium))
                    Spacer()
                    Text(details?.gender ?? "None")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                }
                .padding([.trailing,.leading, .bottom], 16)
            }
            .padding([.leading, .trailing], 24)
            .backgroundStyle(.secondary)
            .cornerRadius(16)
        }
    }
}

struct InfoDetails_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetails()
    }
}
