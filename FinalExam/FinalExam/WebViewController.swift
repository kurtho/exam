//
//  WebViewController.swift
//  FinalExam
//
//  Created by KurtHo on 2016/7/24.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = WKWebView(frame:UIScreen.mainScreen().bounds)
        self.view.addSubview(webView)
        let url = NSURL(string: "https://www.alphacamp.co/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
