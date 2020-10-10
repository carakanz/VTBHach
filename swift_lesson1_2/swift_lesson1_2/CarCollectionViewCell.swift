//
//  CarCollectionViewCell.swift
//  AutoMobile
//
//  Created by Екатерина Вишневская on 10.10.2020.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    
    enum Locals {
        static let cellID = "carcell"
        static let height: CGFloat = 200
    }
    
    // MARK: - Properties
    
    private var titleLabel: UILabel!
    private var priceLabel: UILabel!
    private var photoImageView: UIImageView!
    
    
    var viewModel: CarModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            updateContent(viewModel: viewModel)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAndConfigureTitleView()
        addAndConfigurePriceView()
        addAndConfigureCoverView()
        contentView.layer.borderWidth = 1
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.black.cgColor
        setConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    private func updateContent(viewModel: CarModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = String(viewModel.price) + "Р"
        photoImageView.image = viewModel.photo
        
    }
    
    // MARK: -UI
    private func addAndConfigureCoverView () {
        photoImageView = UIImageView()
        photoImageView.image = UIImage(named: "Car")
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(photoImageView)
    }
    
    private func addAndConfigureTitleView () {
        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
    }
    
    private func addAndConfigurePriceView () {
        priceLabel = UILabel()
        priceLabel.textColor = .black
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
    }
}
