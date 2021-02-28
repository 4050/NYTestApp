//
//  WebViewController.swift
//  VRGSoftTestApp
//
//  Created by Stanislav on 28.02.2021.
//

import UIKit
import WebKit
import Alamofire

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    public var stringURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderURL(url: stringURL!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func renderURL(url: String) {
        self.webView.loadHTMLString(url, baseURL: nil)
    }
    
    
}
