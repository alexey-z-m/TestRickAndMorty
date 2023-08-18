//
//  DetailsScreenViewController.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import SwiftUI

class DetailsScreenViewController: UIHostingController<DetailsScreen> {
    init() {
        super.init(rootView: DetailsScreen())
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
