//
//  MainScreen.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import SwiftUI
import UIKit

struct MainScreen: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return MainScreenViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
}

struct MainScreenView: View {
    var body: some View {
        MainScreen()
            .ignoresSafeArea()
    }
}
