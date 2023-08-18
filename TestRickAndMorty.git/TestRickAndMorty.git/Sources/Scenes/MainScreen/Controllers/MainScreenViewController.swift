//
//  MainScreenViewController.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import UIKit

class MainScreenViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Characters"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        return label
    }()

    private lazy var layoutCollection = getLayoutCollection()
    private lazy var charactersCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutCollection)
        collection.register(
            CollectionViewCell.self,
            forCellWithReuseIdentifier: CollectionViewCell.identifier
        )

        collection.backgroundColor = .clear
        collection.isUserInteractionEnabled = true
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        charactersCollection.dataSource = self
        charactersCollection.delegate = self
    }

    func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(charactersCollection)
    }

    func setupLayout() {
        view.backgroundColor = UIColor(red: 0.016, green: 0.047, blue: 0.118, alpha: 1)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true

        charactersCollection.translatesAutoresizingMaskIntoConstraints = false
        charactersCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        charactersCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        charactersCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        charactersCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    func getLayoutCollection() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 31, left: 20, bottom: 0, right: 27)
        layout.itemSize = CGSize(
            width: (view.frame.size.width - 20 - 16 - 27) / 2,
            height: ((view.frame.size.width - 20 - 16 - 27) / 2) * 1.3
        )
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        return layout
    }
}

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = charactersCollection.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath
        ) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension MainScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.1, animations: { cell?.alpha = 0.5 }) { (completed) in
            UIView.animate(withDuration: 0.1, animations: { cell?.alpha = 1 })
        }
    }
}

