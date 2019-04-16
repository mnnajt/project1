//
//  RepositoryDetailsViewController.swift
//  project1
//
//  Created by Michał Kaliniak on 16/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {

    private let viewModel : RepositoryDetailsViewModel
    private let nameLabel : UILabel
    private let fullNameLabel : UILabel
    private let descriptionLabel : UILabel
    private let websiteButton : UIButton
    
    init(viewModel: RepositoryDetailsViewModel) {
        self.viewModel = viewModel
        self.nameLabel = UILabel()
        self.fullNameLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.websiteButton = UIButton()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        initViews()
        addViews()
        setupConstraints()
        needViewUpdate()
    }
    
    private func initViews() {

        nameLabel.font = UIFont.systemFont(ofSize: 32)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        
        fullNameLabel.font = UIFont.systemFont(ofSize: 18)
        fullNameLabel.textAlignment = .left
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
    }
    
    private func addViews() {
        self.view.addSubview(nameLabel)
        self.view.addSubview(fullNameLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(websiteButton)
    }
    
    private func setupConstraints () {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true

        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        fullNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        fullNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        fullNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true

    }
    
}

extension RepositoryDetailsViewController : ViewModelDelegate {
    
    func needViewUpdate() {
        nameLabel.text = viewModel.name
        fullNameLabel.text = viewModel.fullName
        descriptionLabel.text = viewModel.repositoryDescription
    }
    
    func needViewUpdateWithNewData() {
        
    }
}
