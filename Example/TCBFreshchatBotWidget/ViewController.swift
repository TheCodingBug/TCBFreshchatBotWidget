//
//  ViewController.swift
//  TCBFreshchatBotWidget
//
//  Created by Neil Francis Ramirez Hipona on 08/26/2021.
//  Copyright (c) 2021 Neil Francis Ramirez Hipona. All rights reserved.
//

import UIKit
import WebKit
import TCBFreshchatBotWidget

class ViewController: UIViewController {

    
    @IBOutlet weak var widgetView: TCBFreshchatBotWidgetView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // set and call whenever needed
        let clientData: [String: Any] = ["name": "TCBFreshchatBotWidget User"]
        let botWidget = TCBFreshchatBotWidget(clientHash: "d4980410f479d76eba5e00335eae38e8b04fd21e",
                                              botHash: "f90f6dfa4d478848d045c31ac0493f730c8368fd",
                                              showWidget: true,
                                              clientData: clientData)
        
        widgetView.loadWidget(withBotWidget: botWidget)
        
        // or
        
        widgetView.loadWidget(withBotWidget: botWidget,
                              in: .developerDirectory,
                              inDomain: .userDomainMask)
    }
}

extension ViewController: WKUIDelegate {
    
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        switch navigationAction.navigationType {
        case .linkActivated:
            webView.load(navigationAction.request)
            
        case .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let absoluteString = webView.url?.absoluteString ?? ""
        print("webView: \(absoluteString)")
    }
}
