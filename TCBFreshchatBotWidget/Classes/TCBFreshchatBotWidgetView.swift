//
//  TCBFreshchatBotWidgetView.swift
//  TCBFreshchatBotWidget
//
//  Created by Neil Francis Hipona on 8/26/21.
//

import Foundation
import UIKit
import WebKit

class TCBFreshchatBotWidgetView: UIView {
    
    private lazy var jScript: String = {
        // add sizing
        var jScript = "let meta = document.createElement('meta');"
        jScript += "meta.setAttribute('name', 'viewport');"
        jScript += "meta.setAttribute('content', 'width=device-width');"
        jScript += "document.getElementsByTagName('head')[0].appendChild(meta);"
        
        // add font config
        jScript += "let style = document.createElement('style');"
        jScript += "style.innerHTML = 'body { -webkit-text-size-adjust: none; }';"
        jScript += "document.getElementsByTagName('head')[0].appendChild(style);"
        
        return jScript
    }()
    
    private lazy var welcomeHTML: String = {
        var htmlString = "<html>"
        htmlString += "<body>"
        htmlString += "<h3>Hello from TCBFreshchatBotWidget</h3>"
        htmlString += "<br /><br />"
        htmlString += "GitHub: <a href='https://github.com/TheCodingBug/TCBFreshchatBotWidget'>TCBFreshchatBotWidget</a>"
        htmlString += "<br />"
        htmlString += "License: <a href='https://github.com/TheCodingBug/TCBFreshchatBotWidget/blob/main/LICENSE'>MIT License</a>"
        htmlString += "</body>"
        htmlString += "</html>"
        
        return htmlString
    }()
    
    private var wkUController: WKUserContentController {
        let wkUScript = WKUserScript(source: jScript, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        
        let wkUController = WKUserContentController()
        wkUController.addUserScript(wkUScript)
                
        return wkUController
    }
    
    private var wkWebView: WKWebView!
    
    var uiDelegate: WKUIDelegate?
    var navigationDelegate: WKNavigationDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareWKWebView()
    }
    
    private func prepareWKWebView() {
        let wkWebConfig = WKWebViewConfiguration()
        wkWebConfig.userContentController = wkUController
        
        let webFrameSize = frame.size
        let webFrame = CGRect(x: 0, y: 0, width: webFrameSize.width, height: webFrameSize.height)
        
        let wkWV = WKWebView(frame: webFrame, configuration: wkWebConfig)
        wkWV.uiDelegate = uiDelegate
        wkWV.navigationDelegate = navigationDelegate

        addSubview(wkWV)
        pinViewToView(wkWV, to: self)
        wkWebView = wkWV
    }
    
    private func pinViewToView(_ view: UIView, to: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: to, attribute: .top, multiplier: 1, constant: 0)
        
        let bot = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: to, attribute: .bottom, multiplier: 1, constant: 0)
        
        let left = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: to, attribute: .leading, multiplier: 1, constant: 0)
        
        let right = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: to, attribute: .trailing, multiplier: 1, constant: 0)
        
        to.addConstraints([top, bot, left, right])
    }
}

extension TCBFreshchatBotWidgetView {
    
    func loadRequest(request: URLRequest) {
        
        wkWebView.load(request)
    }
    
    func loadHTMLString(htmlString: String, baseURL: URL?) {
        
        wkWebView.loadHTMLString(htmlString, baseURL: baseURL)
    }
    
    func loadFileURL(fileURL: URL, allowingReadAccessTo allowAccessToURL: URL) {
        
        wkWebView.loadFileURL(fileURL, allowingReadAccessTo: allowAccessToURL)
    }
    
    func load(data: Data, mimeType: String, characterEncodingName encoding: String, baseURL: URL) {
        
        wkWebView.load(data, mimeType: mimeType, characterEncodingName: encoding, baseURL: baseURL)
    }
}

extension TCBFreshchatBotWidgetView {
    
    func loadWidget(withWidgetData widgetData: TCBFreshchatBotWidget) {
        widgetData.createWidgetFile()
        
        if let fileURL = widgetData.loadWidgetFileURL() {
            loadFileURL(fileURL: fileURL, allowingReadAccessTo: fileURL)
            if widgetData.debugLogging { print("TCBFreshchatBotWidgetView:: Resource file loaded") }
        }else{
            if widgetData.debugLogging { print("TCBFreshchatBotWidgetView:: Could not load resource file") }
        }
    }
}
