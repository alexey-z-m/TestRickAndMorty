//
//  OriginDetails.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import SwiftUI

struct OriginDetails: View {
    @State var details: DetailsLocation? = Network.detailsLocation
    var body: some View {
        HStack {
            Text("Origin")
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
            VStack() {
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 64, height: 64)
                            .cornerRadius(10)
                            .foregroundColor(Color(red: 0.1, green: 0.11, blue: 0.16))
                        Image(systemName: "globe")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                    .padding(8)
                    VStack(alignment: .leading,spacing: 8) {
                        Text(details?.name ?? "Unknown")
                            .foregroundColor(.white)
                            .bold()
                        Text(details?.type ?? "-")
                            .foregroundColor(.green)
                            .font(.system(size: 13))
                    }
                    Spacer()
                }
                .padding([.leading,.trailing], 24)
            }
        }
    }
}

struct OriginDetails_Previews: PreviewProvider {
    static var previews: some View {
        OriginDetails()
    }
}
