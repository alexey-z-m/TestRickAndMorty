//
//  CollectionViewCell.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import UIKit

protocol CollectionViewCellProtocol: UICollectionViewCell {
    func configure(character: CharacterSchema)
}

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        return indicator
    }()

    private lazy var characterImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear//.secondaryLabel
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let characterName: UILabel = {
        let label = UILabel()
        label.text = "Rick Sanchez"
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        activityIndicator.startAnimating()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func prepareForReuse() {
        characterImage.image = nil
        activityIndicator.startAnimating()
    }

    func setupHierarchy() {
        contentView.addSubview(characterImage)
        characterImage.addSubview(activityIndicator)
        contentView.addSubview(characterName)
    }

    func setupLayout() {
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = UIColor(red: 0.15, green: 0.163, blue: 0.221, alpha: 1)

        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16).isActive = true
        characterImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16).isActive = true
        characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        characterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true

        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        characterName.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16).isActive = true
        characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 16).isActive = true
        characterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true



        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: characterImage.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: characterImage.centerYAnchor).isActive = true
    }
}

extension CollectionViewCell: CollectionViewCellProtocol {
    func configure(character: CharacterSchema) {
        characterName.text = character.name
        UIImage().setImageByURL(imageView: characterImage, url: character.image)
        activityIndicator.stopAnimating()
    }
}
extension UIImage {
    func setImageByURL(imageView: UIImageView, url: String?) {
        let queue = DispatchQueue(label: "loadImage")
        queue.async {
            guard let imagePath = url,
                  let imageURL = URL(string: imagePath),
                  let imageData = try? Data(contentsOf: imageURL) else {
                DispatchQueue.main.async {
                    imageView.image = UIImage(systemName: "photo")
                }
                return
            }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
}
