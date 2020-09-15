//
//  ProgressHudView.swift
//  WeatherApp
//
//  Created by Vibha on 2020/09/10.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

public class ProgressHudView: UIView {

    fileprivate let singlePadding: CGFloat = 8
    fileprivate let doublePadding: CGFloat = 16
    fileprivate let quadPadding: CGFloat = 32
    
    fileprivate let activityIndicatorView: UIActivityIndicatorView

    public init() {
        activityIndicatorView = UIActivityIndicatorView()
        super.init(frame: .zero)
        configureView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension ProgressHudView {
    
    @objc static func showProgressHud(inView view: UIView) -> ProgressHudView {
        let progressHudView = ProgressHudView()
        progressHudView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(progressHudView)
        progressHudView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressHudView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return progressHudView
    }
    
    @objc func hide() {
        UIView.animate(withDuration: 0.3,
                       animations: setAlphaToZero,
                       completion: removeFromSuperview(_:))
    }
}

fileprivate extension ProgressHudView {
    
    func configureView() {
        backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        alpha = 0.80
        layer.cornerRadius = singlePadding
        configureActivityIndicatorView()
        configureConstraints()
    }
    
    func configureActivityIndicatorView() {
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = .white
        activityIndicatorView.startAnimating()
        addSubview(activityIndicatorView)
    }
    
    func configureConstraints() {
        let topPadding = doublePadding + singlePadding / 2
        activityIndicatorView.topAnchor.constraint(equalTo: topAnchor, constant: topPadding).isActive = true
        activityIndicatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: quadPadding).isActive = true
        activityIndicatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -quadPadding).isActive = true
    }
    
    func setAlphaToZero() {
        alpha = 0
    }
    
    func removeFromSuperview(_ completion: Bool) {
        removeFromSuperview()
    }
    
}

