//
//  TweetHeader.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 30/12/2020.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    var tweet: Tweet? {
        didSet { configure() }
    }
    
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
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "fullnameLabel"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "usernameLabel"
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "captionLabel"
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "6:33PM ・ 28/12/2020"
        return label
    }()
    
    private lazy var optionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "down_arrow_24pt"), for: .normal)
        button.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        return button
    }()
    
    private lazy var retweetsLabel = UILabel()
    
    private lazy var likesLabel = UILabel()
    
    private lazy var statsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let divider1 = UIView()
        divider1.backgroundColor = .systemGroupedBackground
        view.addSubview(divider1)
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider1.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        divider1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        divider1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        divider1.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [retweetsLabel, likesLabel])
        stack.axis = .horizontal
        stack.spacing = 12
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        let divider2 = UIView()
        divider2.backgroundColor = .systemGroupedBackground
        view.addSubview(divider2)
        divider2.translatesAutoresizingMaskIntoConstraints = false
        divider2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        divider2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        divider2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        divider2.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        return view
    }()
    
    private lazy var commentButton: UIButton = {
        let button = createButton(withImageName: "comment")
        button.addTarget(self, action: #selector(handleCommentTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var retweetButton: UIButton = {
        let button = createButton(withImageName: "retweet")
        button.addTarget(self, action: #selector(handleRetweetTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = createButton(withImageName: "like")
        button.addTarget(self, action: #selector(handleLikeTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = createButton(withImageName: "share")
        button.addTarget(self, action: #selector(handleShareTapped), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel])
        labelStack.axis = .vertical
        labelStack.spacing = -6
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, labelStack])
        stack.spacing = 12
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        addSubview(captionLabel)
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 12).isActive = true
        captionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        captionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 20).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        addSubview(optionButton)
        optionButton.translatesAutoresizingMaskIntoConstraints = false
        optionButton.centerYAnchor.constraint(equalTo: stack.centerYAnchor).isActive = true
        optionButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        addSubview(statsView)
        statsView.translatesAutoresizingMaskIntoConstraints = false
        statsView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 12).isActive = true
        statsView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        statsView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        statsView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let actionStack = UIStackView(arrangedSubviews: [commentButton, retweetButton, likeButton, shareButton])
        actionStack.axis = .horizontal
        actionStack.spacing = 72
        
        addSubview(actionStack)
        actionStack.translatesAutoresizingMaskIntoConstraints = false
        
        actionStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        actionStack.topAnchor.constraint(equalTo: statsView.bottomAnchor, constant: 16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func handleProfileImageTapped() {
        
    }
    
    @objc func showActionSheet() {
        print("DEBUG: ActionSheet")
    }
    
    @objc func handleCommentTapped() {
        
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
        fullnameLabel.text = tweet.user.fullname
        usernameLabel.text = viewModel.usernameText
        profileImageView.sd_setImage(with: viewModel.profileImageUrl, completed: nil)
        dateLabel.text = viewModel.headerTimestamp
        retweetsLabel.attributedText = viewModel.retweetsAttributedString
        likesLabel.attributedText = viewModel.likesAttributedString
    }
    
    func createButton(withImageName imageName: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return button
    }
    
}
