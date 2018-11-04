//
//  RepositoriesTableViewCell.swift
//  RepoFinder
//
//  Created by Abdelrahman Mohamed on 11/1/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoriesTableViewCell: UITableViewCell {
    
    static let identifier = "RepositoriesTableViewCell"
    
    @IBOutlet weak var repoView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    
    var makeSeeUserInfoAction: (()->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.usernameLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
        self.repoNameLabel?.font = Font(.installed(.regular), size: .standard(.h2)).instance
        self.usernameLabel.textColor = Color.white.value
        self.repoNameLabel.textColor = Color.white.value
        self.selectionStyle = .none
        self.repoView.layer.cornerRadius = 20
        self.avatarImageView.layer.cornerRadius = 20
        
        let recognizeravatarImageView = UITapGestureRecognizer(target: self, action: #selector(userInfoTouched(_:)))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(recognizeravatarImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(item: Item) {
        
        avatarImageView.sd_setImage(with: URL(string: (item.owner?.avatarURL) ?? ""), placeholderImage: UIImage(named: "GitHub"))
        usernameLabel.text = item.owner?.login
        repoNameLabel.text = item.name
    }
    
    @IBAction func userInfoTouched(_ sender: Any) {
        makeSeeUserInfoAction?()
    }
}
