//
//  CarDetailsVC.swift
//  swift_lesson1_2
//
//  Created by Екатерина Вишневская on 10.10.2020.
//  Copyright © 2020 16817252. All rights reserved.
//

import UIKit

class CarDetailsVC: UIViewController {

    var carModel: CarModel?
    var photoImageView = UIImageView()
    var titleLabel = UILabel()
    var priceLabel = UILabel()
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        photoImageView.image = carModel?.photo ?? UIImage(named: "Car")
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoImageView)
        
        titleLabel.textColor = .black
        titleLabel.text = carModel?.title ?? "X"
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        priceLabel.textColor = .black
        priceLabel.text =  "\(carModel?.price ?? 100) P"
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceLabel)
        
        button.setTitle("Оформить кредит", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4),
            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setCar(_ car: CarModel) {
        carModel = car
    }
}
