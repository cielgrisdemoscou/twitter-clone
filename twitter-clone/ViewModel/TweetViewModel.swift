//
//  TweetViewModel.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 27/12/2020.
//

import UIKit

struct TweetViewModel {
    
    let tweet: Tweet
    let user: User
    
    var profileImageUrl: URL? {
        return user.profileImageUrl
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now) ?? "2m"
    }
    
    var usernameText: String {
        return "@\(user.username)"
    }
    
    var headerTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a ・ MM/dd/yyyy"
        return formatter.string(from: tweet.timestamp)
    }
    
    var retweetsAttributedString: NSAttributedString? {
        attributedText(withValue: tweet.retweetCount, text: "Retweets")
    }
    
    var likesAttributedString: NSAttributedString? {
        attributedText(withValue: tweet.likes, text: "Likes")
    }
    
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: user.fullname,
                                              attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        title.append(NSAttributedString(string: " @\(user.username)",
                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                     NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        
        title.append(NSAttributedString(string: "　・　\(timestamp)",
                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                    NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        return title
    }
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)",
                                              attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedTitle.append(NSAttributedString(string: " \(text)",
                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                                     NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        return attributedTitle
    }
    
    func size(forWidth width: CGFloat) -> CGSize {
        let measurementLabel = UILabel()
        measurementLabel.text = tweet.caption
        measurementLabel.numberOfLines = 0
        measurementLabel.lineBreakMode = .byWordWrapping
        measurementLabel.translatesAutoresizingMaskIntoConstraints = false
        measurementLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        return measurementLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
