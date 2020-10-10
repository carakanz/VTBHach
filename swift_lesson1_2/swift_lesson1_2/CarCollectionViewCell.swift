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
    private var detailLabel: UILabel!
    private var coverImageView: UIImageView!
    
    
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
        addAndConfigureDetailView()
        addAndConfigureCoverView()
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        setConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    private func updateContent(viewModel: CarModel) {
        titleLabel.text = viewModel.title
        detailLabel.text = viewModel.detail
        coverImageView.image = viewModel.cover
    }
    
    // MARK: -UI
    private func addAndConfigureCoverView () {
        coverImageView = UIImageView()
        coverImageView.image = UIImage(named: "Car")
        coverImageView.contentMode = .scaleAspectFit
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coverImageView)
    }
    
    private func addAndConfigureTitleView () {
        titleLabel = UILabel()
        titleLabel.textColor = .white
        //titleLabel.backgroundColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
    }
    
    private func addAndConfigureDetailView () {
        detailLabel = UILabel()
        detailLabel.textColor = .lightGray
        detailLabel.backgroundColor = .black
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            coverImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            coverImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 120),
            detailLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 120),
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
    }
}
