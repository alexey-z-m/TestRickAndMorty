//
//  MainScreenViewController.swift
//  TestRickAndMorty.git
//
//  Created by Alexey Zablotskiy on 18.08.2023.
//

import UIKit

class MainScreenViewController: UIViewController {

    let network = Network()
    var charactersRM = [CharacterSchema]()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        return indicator
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
        activityIndicator.startAnimating()
        Task {
            try await network.getAllCharacters() { characters in
                self.charactersRM = characters
                DispatchQueue.main.async {
                    print(self.charactersRM.count)
                    self.activityIndicator.stopAnimating()
                    self.charactersCollection.reloadData()
                }
            }
        }
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        setupHierarchy()
        setupLayout()
        charactersCollection.dataSource = self
        charactersCollection.delegate = self
    }


    func setupHierarchy() {

        view.addSubview(charactersCollection)
        charactersCollection.addSubview(activityIndicator)
    }

    func setupLayout() {
        view.backgroundColor = UIColor(red: 0.016, green: 0.047, blue: 0.118, alpha: 1)

        charactersCollection.translatesAutoresizingMaskIntoConstraints = false
        charactersCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true

        charactersCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        charactersCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        charactersCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true


        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func getLayoutCollection() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 27)
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
        return charactersRM.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = charactersCollection.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier,
            for: indexPath
        ) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(character: charactersRM[indexPath.row])
        return cell
    }
}

extension MainScreenViewController: UICollectionViewDelegate {
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.1, animations: { cell?.alpha = 0.5 }) { (completed) in
            UIView.animate(withDuration: 0.1, animations: { cell?.alpha = 1 })
        }
         let viewController = DetailsScreenViewController()
         Network.detailsCharacter = charactersRM[indexPath.row]
         Task {
//             try await network.getLoacationByURL(url: Network.detailsCharacter?.origin.url ?? "") { location in
//                 DispatchQueue.main.async {
//                     Network.detailsLocation = location
//                     self.navigationController?.pushViewController(viewController, animated: true)
//                 }
//             }
             try await network.getDetails(
                urlLocations: Network.detailsCharacter?.origin.url ?? "",
                urlEpisodes: Network.detailsCharacter?.episode ?? []
             ) { (location, episodes) in
                 DispatchQueue.main.async {
                     Network.detailsLocation = location
                     Network.detailsEpisodes = episodes
                     self.navigationController?.pushViewController(viewController, animated: true)
                 }

             }
         }
    }
}

