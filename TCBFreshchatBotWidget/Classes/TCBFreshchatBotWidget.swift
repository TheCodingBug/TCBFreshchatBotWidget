//
//  TCBFreshchatBotWidget.swift
//  TCBFreshchatBotWidget
//
//  Created by Neil Francis Hipona on 8/26/21.
//

import Foundation

class TCBFreshchatBotWidget: NSObject {

    private var clientHash: String = "CLIENT_HASH"
    private var botHash: String = "CLIENT_BOT_HASH"
    private var clientData: [String: Any]?
    
    var debugLogging: Bool = true
    
    private
    override init() {
        super.init()
    }
    
    convenience init(withClientHash cHash: String, botHash bHash: String, clientData cData: [String: Any]? = ["name": "TCBFreshchatBotWidget"]) {
        self.init()
        
        clientHash = cHash
        botHash = bHash
        clientData = cData
    }
}

extension TCBFreshchatBotWidget {
    
    private var clientDataJSONString: String {
        guard let clientData = clientData,
            let jsonData = try? JSONSerialization.data(withJSONObject: clientData, options: .prettyPrinted) else { return "{}" }
        let jsonString = String(data: jsonData, encoding: .utf8)
        return jsonString ?? "{}"
    }
    
    private var jScriptWidget: String {
        let jScriptWidget = "<script> (function (d, w, c) { if(!d.getElementById('spd-busns-spt')) { var n = d.getElementsByTagName('script')[0], s = d.createElement('script'); var loaded = false; s.id = 'spd-busns-spt'; s.async = 'async'; s.setAttribute('data-self-init', 'false'); s.setAttribute('data-init-type', 'opt'); s.src = 'https://cdn.freshbots.ai/assets/share/js/freshbots.min.js'; s.setAttribute('data-client', '\(clientHash)'); s.setAttribute('data-bot-hash', '\(botHash)'); s.setAttribute('data-env', 'prod'); s.setAttribute('data-region', 'us'); if (c) { s.onreadystatechange = s.onload = function () { if (!loaded) { c(); } loaded = true; }; } n.parentNode.insertBefore(s, n); } }) (document, window, function () { Freshbots.initiateWidget({ autoInitChat: true, getClientParams: function () { return \(clientDataJSONString); } }, function(successResponse) { Freshbots.showWidget(true); }, function(errorResponse) { Freshbots.showWidget(true); }); }); </script>"
        
        return jScriptWidget
    }
}

extension TCBFreshchatBotWidget {
    
    func createWidgetFile() {
        let fileName = "TCBFreshchatBotWidget.html"
        
        do {
            var fileURL = try FileManager.default.url(for: .developerDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            fileURL.appendPathComponent(fileName)
            try jScriptWidget.write(to: fileURL, atomically: true, encoding: .utf8)
            
            if debugLogging { print("TCBFreshchatBotWidget:: Resource created") }
        } catch {
            if debugLogging { print("TCBFreshchatBotWidget:: Could not create resource") }
        }
    }
    
    func loadWidgetFileURL() -> URL? {
        let fileName = "TCBFreshchatBotWidget.html"
        
        do {
            var fileURL = try FileManager.default.url(for: .developerDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            fileURL.appendPathComponent(fileName)
            
            if debugLogging { print("TCBFreshchatBotWidget:: Resource loaded") }
            
            return fileURL
        } catch {
            if debugLogging { print("TCBFreshchatBotWidget:: Could not load resource") }
            
            return nil
        }
    }
}
