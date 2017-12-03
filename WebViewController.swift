//
//  ViewController2.swift
//  FreeBottleCoffee
//
//  Created by Hisafumi Kikkawa on 2017/12/02.
//  Copyright © 2017年 shinjukujohnny. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* SSLでないとNG...
        let connectedURL = NSURL(string: "http://shinjukujohnny.dousetsu.com/connected.html")
        let urlRequest = NSURLRequest(url: connectedURL as! URL)
        
        webView.loadRequest(urlRequest as URLRequest)
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
