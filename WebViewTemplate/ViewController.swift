//
//  ViewController.swift
//  WebViewTemplate
//
//  Created by Pablo Weremczuk on 11/28/16.
//  Copyright © 2016 Pablo Weremczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myWebView: UIWebView!
    var urlToLoad:String = "http://weremsoft.net/wall/17qyd6o/123/0/0";
    @IBAction func ClearCacheButton(_ sender: Any) {

        NSLog(myWebView.stringByEvaluatingJavaScript(from: "localStorage.clear();")!);
    }
    
    @IBAction func btnReload(_ sender: Any) {
                loadWebView(urlToLoad: self.urlToLoad);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadWebView(urlToLoad: self.urlToLoad);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadWebView(urlToLoad: String){
        let url = NSURL (string: urlToLoad);
        let requestObj = NSURLRequest(url: url! as URL, cachePolicy:NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0);
        
        myWebView.loadRequest(requestObj as URLRequest);
    }
}

