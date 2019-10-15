//
//  SearchViewController.swift
//  User
//
//  Created by Vandan  on 9/18/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit
import WebKit

class SearchViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var wbPage : WKWebView!
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAddress = URL( string : "https://www.google.ca")!
        let url = URLRequest(url: urlAddress)
        wbPage?.load(url)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
