//
//  TweetService.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 26/12/2020.
//

import Firebase

struct TweetService {
    static let shared = TweetService()
    
    func uploadTweet(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = ["uid": uid,
        "timestamp": Int(NSDate().timeIntervalSince1970),
        "likes": 0,
        "retweets": 0,
        "caption": caption] as [String : Any]
        
        REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
}
