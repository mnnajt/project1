//
//  SearchResultTableViewCell.swift
//  project1
//
//  Created by Michał Kaliniak on 16/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    private let nameLabel : UILabel = UILabel()
    private let starsLabel : UILabel = UILabel()
    private let languageLabel : UILabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
        addViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        starsLabel.text = ""
        languageLabel.text = ""
    }
    
    private func initViews() {
        
        selectionStyle = .none
        
        starsLabel.font = UIFont.systemFont(ofSize: 11)
        languageLabel.font = UIFont.systemFont(ofSize: 12)
        languageLabel.textAlignment = .right
    }
    
    private func addViews() {
        self.addSubview(nameLabel)
        self.addSubview(starsLabel)
        self.addSubview(languageLabel)
    }
    
    private func setupConstraints () {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: languageLabel.leftAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        starsLabel.translatesAutoresizingMaskIntoConstraints = false
        starsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        starsLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        starsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        starsLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        languageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        languageLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        languageLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true

    }
    
    public func configureCell(repository : RepositoryResponse) {
        nameLabel.text = repository.name ?? ""
        if let starsCount = repository.stargazers_count {
            starsLabel.text = "Stars: \(starsCount)"
        }
        languageLabel.text = repository.language ?? ""
    }
}
