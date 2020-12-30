//
//  TweetCell.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 27/12/2020.
//

import UIKit

protocol TweetCellDelegate: class {
    func handleProfileImageTapped(_ cell: TweetCell)
    func handleReplyTapped(_ cell: TweetCell)
}

class TweetCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var tweet: Tweet? {
        didSet { configure() }
    }
    
    weak var delegate: TweetCellDelegate?
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        iv.heightAnchor.constraint(equalToConstant: 48).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 48).isActive = true
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTapped))
        iv.addGestureRecognizer(tap)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "captionLabel"
        return label
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector(handleCommentTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "retweet"), for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector(handleRetweetTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like"), for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector(handleLikeTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "share"), for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.addTarget(self, action: #selector(handleShareTapped), for: .touchUpInside)
        return button
    }()
    
    private let infoLabel = UILabel()

    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [infoLabel, captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0).isActive = true
        stack.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.text = "infoLabel"
        
        let actionStack = UIStackView(arrangedSubviews: [commentButton, retweetButton, likeButton, shareButton])
        actionStack.axis = .horizontal
        actionStack.spacing = 72
        
        addSubview(actionStack)
        actionStack.translatesAutoresizingMaskIntoConstraints = false
        actionStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        actionStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGroupedBackground
        addSubview(underlineView)
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        underlineView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        underlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        underlineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func handleProfileImageTapped() {
        delegate?.handleProfileImageTapped(self)
    }
    
    @objc func handleCommentTapped() {
        delegate?.handleReplyTapped(self)
    }
    
    @objc func handleRetweetTapped() {
        
    }
    
    @objc func handleLikeTapped() {
        
    }
    
    @objc func handleShareTapped() {
        
    }
    //MARK: - Helpers
    
    func configure() {
        guard let tweet = tweet else { return }
        let viewModel = TweetViewModel(tweet: tweet)
        
        captionLabel.text = tweet.caption
        profileImageView.sd_setImage(with: viewModel.profileImageUrl, completed: nil)
        infoLabel.attributedText = viewModel.userInfoText
        
    }
}
