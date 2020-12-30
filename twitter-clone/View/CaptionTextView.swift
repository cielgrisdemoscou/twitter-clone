//
//  CaptionTextView.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 26/12/2020.
//

import UIKit

class CaptionTextView: UITextView {
    
    // MARK: - Properties
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "What's happening?"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        placeholderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func handleTextChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }
}
