//
//  WebViewController.swift
//  Auth-System
//
//  Created by Kenan Baylan on 17.03.2023.
//

import UIKit
import WebKit


class WebViewController: UIViewController {

    private let webView =  WKWebView()
    
    private let urlString : String
    
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        guard let url = URL(string: self.urlString) else {
            self.dismiss(animated: true)
            return
        }
        
        self.webView.load(URLRequest(url: url))
        
        
    }
    
    
    
    //MARK: setup UI
    private func setupUI() {
        
        //bar button items
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(barButtonDone))
        
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        
        
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            //HeaderView
            self.webView.topAnchor.constraint(equalTo: view.topAnchor),
            self.webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.webView.trailingAnchor.constraint (equalTo: view.trailingAnchor),
            self.webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])

    }
    
}

extension WebViewController {
    
    
    @objc private func barButtonDone() {
        self.dismiss(animated: true)
        
    }
}
