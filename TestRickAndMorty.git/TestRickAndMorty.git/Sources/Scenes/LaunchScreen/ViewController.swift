//
//  ViewController.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import UIKit

class ViewController: UIViewController {

    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundLaunch")
        return image
    }()

    private let portalImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "portal")
        return image
    }()

    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    func setupHierarchy() {
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(portalImage)
        backgroundImage.addSubview(logoImage)

    }

    func setupLayout() {
        view.backgroundColor = UIColor(red: 0.016, green: 0.047, blue: 0.118, alpha: 1)

        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -27).isActive = true

        portalImage.translatesAutoresizingMaskIntoConstraints = false
        portalImage.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -280).isActive = true
        portalImage.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 102).isActive = true
        portalImage.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -92).isActive = true

        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.bottomAnchor.constraint(equalTo: portalImage.topAnchor, constant: -36).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 102).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -92).isActive = true
    }

}

