//
//  OwnerTableViewCell.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/4/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SDWebImage

class OwnerTableViewCell: UITableViewCell {
    
    static let identifier = "OwnerTableViewCell"
    
    @IBOutlet weak var repoView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.usernameLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
        self.fullNameLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
        self.followersLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
        self.followingLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
        self.usernameLabel.textColor = Color.white.value
        self.fullNameLabel.textColor = Color.white.value
        self.followersLabel.textColor = Color.white.value
        self.followingLabel.textColor = Color.white.value
        self.selectionStyle = .none
        self.repoView.layer.cornerRadius = 20
        self.avatarImageView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(owner: Owner) {
        
        avatarImageView.sd_setImage(with: URL(string: (owner.avatarURL) ?? ""), placeholderImage: UIImage(named: "GitHub"))
        usernameLabel.text = owner.login
        fullNameLabel.text = owner.name
        followersLabel.text = "\(owner.followers ?? 0) Followers"
        followingLabel.text = "\(owner.following ?? 0) Following"
    }
}
