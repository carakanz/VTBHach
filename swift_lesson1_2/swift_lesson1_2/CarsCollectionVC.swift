//
//  FavoritesVC.swift
//  AutoMobile
//
//  Created by Екатерина Вишневская on 10.10.2020.
//

import UIKit

class CarsCollectionVC: UIViewController {
    
    // MARK: - Properties
    
    private var collectionView: UICollectionView!
    private var carModels: [CarModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.tintColor = .white
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 0.00, green: 0.38, blue: 1.00, alpha: 1.00)
        navigationItem.title = "Избранное"
        setCollectionView()
        loadData()
    }

    
    // MARK: - Configurations
    
    private func setCollectionView() {
        
        let flowLayout = UICollectionViewFlowLayout ()
        flowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.register(CarCollectionViewCell.self, forCellWithReuseIdentifier: CarCollectionViewCell.Locals.cellID)
    }
    
    private func loadData() {
        carModels = []
        for _ in 0...9 {
            carModels.append(CarModel(title: "XXX"))
        }
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegate

extension CarsCollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarCollectionViewCell.Locals.cellID, for: indexPath) as? CarCollectionViewCell else {
            fatalError()
        }
        cell.viewModel = carModels[indexPath.row]
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CarsCollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width*0.75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let carVC = CarDetailsVC()
        carVC.setCar(carModels[indexPath.row])
        self.navigationController?.pushViewController(carVC, animated: true)
    }
}


