//
//  NotificationController.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 22/12/2020.
//

import UIKit

class NotificationController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()

    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
}
