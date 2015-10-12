//
//  ViewController.swift
//  CrashSpace
//
//  Created by Kevin Jordan on 10/11/15.
//  Copyright © 2015 NetKruzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let url = "https://crashspacela.com/sign/"
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sliderMins: UILabel!
    

    @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var message: UITextField!
    
    @IBAction func refreshWeb(sender: AnyObject) {
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    
    }
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        let currentValue = Int(sender.value)
        
        sliderMins.text = "\(currentValue)"
    }
    
    func loadWebView(urlParameters: String){
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadWebView("")
    }

    override func viewDidAppear(animated: Bool) {
        self.loadWebView("")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    /*
     * Send request to the big button
     */
    //http://crashspacela.com/sign/?id=Kevin&msg=test!&type=iOS&diff_mins_max=1

    @IBAction func checkIn(sender: AnyObject) {
        let urlString =  "\(url)?id=\(user.text!)&msg=\(message.text!)&type=iOS&diff_mins_max=\(sliderMins.text!)&debug=1"
        
        let requestURL = NSURL(string:urlString)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    

}

