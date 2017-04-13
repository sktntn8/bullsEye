//
//  aboutViewController.swift
//  bullsEye
//
//  Created by Mohamed on 4/12/17.
//  Copyright © 2017 geekFactory. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            if let htmlData = try? Data(contentsOf: url){
            let baseURL = URL(fileURLWithPath:  Bundle.main.bundlePath)
//                infoWebView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
                let htmlString = String(data: htmlData, encoding: String.Encoding.utf8)
                
                infoWebView.loadHTMLString(htmlString!, baseURL: nil)

            
            
            }
        

        
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var infoWebView: UIWebView!
    @IBAction func backPressed(_ sender: UIButton) {
        
        
        
        dismiss(animated: true, completion: nil)
        
        
    }



}
