//
//  webview.swift
//  RecipeApp
//
//  Created by DCS on 24/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
import WebKit

class webview: UIViewController,WKUIDelegate {

    var webview: WKWebView?
    
    var query:String?
    
    init(search:String)
    {
        super.init(nibName: nil, bundle: nil)
        query = search
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        
        let webc = WKWebViewConfiguration()
        webview = WKWebView(frame: .zero,configuration: webc)
        webview?.uiDelegate = self
        
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let myurl = URL(string: "https://www.indianhealthyrecipes.com/?s=\(query!)")
        let myurl = URL(string: "https://www.indianhealthyrecipes.com/\(query!)")
        let req = URLRequest(url: myurl!)
        webview?.load(req)
    }
}
