//
//  ConversationController.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 22/12/2020.
//

import UIKit

class ConversationController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()

    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }
}
