//
//  WebSiteViewController.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 25/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit
import WebKit

class WebSiteViewController: UIViewController {
    
    //MARK: - Variables locales
    var url : String?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK: - IBOutlets
    @IBOutlet weak var myWebCustomView: WKWebView!
    
    //MARK: - IBactions
    @IBAction func myCloseCustomACTION(_ sender: Any) {
        appDelegate.puedoRotar = false
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlDes = url else {return}
        if let urlRequestDes = URL(string: "https://\(urlDes)"){
            myWebCustomView.load(URLRequest(url: urlRequestDes))
        }
        appDelegate.puedoRotar = true
    }
    

}
