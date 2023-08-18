//
//  MainDetail.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import SwiftUI

struct MainDetails: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .frame(width: 148,height: 148)
            .cornerRadius(16)
            .padding(.bottom, 24)
        Text("Rick Sanchez")
            .foregroundColor(.white)
            .bold()
            .font(.system(size: 22))
        Text("Alive")
            .foregroundColor(.green)
            .padding(.top, 4)
    }
}

struct MainDetails_Previews: PreviewProvider {
    static var previews: some View {
        MainDetails()
    }
}
