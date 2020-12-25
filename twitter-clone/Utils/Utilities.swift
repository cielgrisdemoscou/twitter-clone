//
//  Utilities.swift
//  twitter-clone
//
//  Created by Ted Hyeong on 25/12/2020.
//

import UIKit

class Utilities {
    
    func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iv.image = image
        
        view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        iv.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        textField.leftAnchor.constraint(equalTo: iv.rightAnchor, constant: 8).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        dividerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        dividerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 0.75).isActive = true
        
        return view
    }
    
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)])
        return tf
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart,
                                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),       NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: secondPart,
                                                  attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }
}
