//
//  RepositoriesTableViewCell.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoriesTableViewCell: UITableViewCell, RepositoriesCellView {
    
    @IBOutlet weak var repoView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    
    var profilePictureTapped: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
        setupTextColors()
        setupCornerRadius()
        setupProfilePictureGesture()
        selectionStyle = .none
    }
    
    private func setupFonts() {
        usernameLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
        repoNameLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
    }
    
    private func setupTextColors() {
        usernameLabel.textColor = Color.white.value
        repoNameLabel.textColor = Color.white.value
    }
    
    private func setupCornerRadius() {
        repoView.layer.cornerRadius = 20
        avatarImageView.layer.cornerRadius = 20
    }
    
    private func setupProfilePictureGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profilePictureTapped(_:)))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func profilePictureTapped(_: UITapGestureRecognizer) {
        profilePictureTapped?()
    }
    
    func configure(viewModel: RepoViewModel) {
        usernameLabel.text = viewModel.username
        repoNameLabel.text = viewModel.name
        avatarImageView.load(url: viewModel.avatarUrl, placeholderImage: "Github")
    }
}
