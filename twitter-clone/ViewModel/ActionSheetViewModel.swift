//
//  ActionSheetViewModel.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 31/12/2020.
//

import Foundation

struct ActionSheetViewModel {
    
    private let user: User
    
    var options: [ActionSheetOptions] {
        var results = [ActionSheetOptions]()
        
        if user.isCurrentUser {
            results.append(.delete)
        } else {
            print(user.isFollowed)
            let followOption: ActionSheetOptions = user.isFollowed ? .unfollow(user) : .follow(user)
            print(followOption)
            results.append(followOption)
        }
        
        results.append(.report)
        return results
    }
    
    init(user: User) {
        self.user = user
    }
}

enum ActionSheetOptions {
    case follow(User)
    case unfollow(User)
    case report
    case delete
    
    var description: String {
        switch self {
        case .follow(let user): return "Follow @\(user.username)"
        case .unfollow(let user): return "Unfollow @\(user.username)"
        case .report: return "Report Tweet"
        case .delete: return "Delete Tweet"
            
        }
    }
}
