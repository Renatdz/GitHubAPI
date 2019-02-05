//
//  ErrorView.swift
//  GitHubAPI
//
//  Created by renato.mendes on 05/02/19.
//  Copyright © 2019 Renato Mendes. All rights reserved.
//

import UIKit

public protocol ErrorViewDelegate: class {
    func tryAgain()
}

public final class ErrorView: UIView {
    
    public weak var delegate: ErrorViewDelegate?
    
    private lazy var message: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var tryAgain: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tente novamente", for: .normal)
        button.setTitleColor(UIColor(red: 0.0, green: 0.4, blue: 1.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.addTarget(self, action: #selector(didTouchTryAgainButton), for: .touchUpInside)
        return button
    }()
    
    init(delegate: ErrorViewDelegate?, frame: CGRect = .zero) {
        super.init(frame: frame)
    
        self.delegate = delegate
        
        buildCodableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ErrorView {
    
    @objc
    func didTouchTryAgainButton() {
        delegate?.tryAgain()
    }
    
    func set(message: String) {
        self.message.text = message
    }
}

extension ErrorView: CodableView {
    
    public func buildHierarchy() {
        addSubview(message)
        addSubview(tryAgain)
    }
    
    public func buildConstraints() {
        message.topConstraint(parentView: self, constant: 20)
        message.leftConstraint(parentView: self, constant: 20)
        message.rightConstraint(parentView: self, constant: 20)
        
        tryAgain.overConstraint(topItem: message, constant: 20)
        tryAgain.leftConstraint(parentView: self, constant: 20)
        tryAgain.rightConstraint(parentView: self, constant: 20)
        tryAgain.bottomConstraint(parentView: self, constant: 20)
    }
    
    public func setup() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}
