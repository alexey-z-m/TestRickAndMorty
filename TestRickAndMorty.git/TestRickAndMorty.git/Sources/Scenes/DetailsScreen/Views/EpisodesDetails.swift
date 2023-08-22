//
//  EpisodesDetails.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import SwiftUI

struct EpisodesDetails: View {
    @State var details: [Episode] = Network.detailsEpisodes
    let col = [GridItem(.flexible())]
    func convert(_ ep: String) -> String {
        let s = ep[ep.index(ep.startIndex, offsetBy: 1)..<ep.index(ep.startIndex, offsetBy: 3)]
        let e = ep[ep.index(ep.startIndex, offsetBy: 4)..<ep.index(ep.endIndex, offsetBy: 0)]
        return "Episode: \(e), Season: \(s)"
    }
    var body: some View {
        Group {
            HStack {
                Text("Episodes")
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .bold()

                Spacer()
            }
            .padding([.leading, .trailing, .top], 24)
            LazyVGrid(columns: col) {
                ForEach(0..<details.count) { index in
                    ZStack {
                        Rectangle()
                            .cornerRadius(16)
                            .foregroundColor(Color(red: 0.15, green: 0.16, blue: 0.22))
                            .padding([.leading, .trailing], 24)
                        VStack() {
                            HStack {
                                VStack(alignment: .leading,spacing: 16) {
                                    Text(details[index].name)
                                        .foregroundColor(.white)
                                        .bold()
                                    HStack{
                                        Text(convert(details[index].episode))
                                            .foregroundColor(.green)
                                            .font(.system(size: 13))
                                        Spacer()
                                        Text(details[index].air_date)
                                            .multilineTextAlignment(.trailing)
                                            .foregroundColor(Color(red: 0.58, green: 0.6, blue: 0.61))
                                            .font(.system(size: 13))
                                    }
                                }
                                .padding(16)
                                Spacer()
                            }
                            .padding([.leading,.trailing], 24)
                        }
                    }
                    .padding(.bottom, 8)
                }
            }
            Spacer()
        }
    }
}

struct EpisodesDetails_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesDetails()
    }
}
