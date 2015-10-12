//
//  ViewController.swift
//  CrashSpace
//
//  Created by Kevin Jordan on 10/11/15.
//  Copyright © 2015 NetKruzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Url to get the current status
    // and to send updates to
    let url = "https://crashspacela.com/sign/"
    @IBOutlet weak var slider: UISlider!
    
    // variables that connect to items on the storyboard
    @IBOutlet weak var sliderMins: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var message: UITextField!
    
    /*
        Function to update screen with the freshest web data
    */
    @IBAction func refreshWeb(sender: AnyObject) {
       self.loadWebView("")
    }
    
    /*
        Update the slider value's label to reflect where the slider is currently positioned
    */
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        let currentValue = Int(sender.value)
        
        sliderMins.text = "\(currentValue)"
    }
    
    /*
        Quick function to load a url into the main webview
    */
    
    func loadWebView(urlParameters: String){
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    /*
        load up the webView with the crashspace URL
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        //call the updateWebView url
        self.loadWebView("")
    }
    /*
        On reappear of the screen, update the webview
    */
    override func viewDidAppear(animated: Bool) {
        self.loadWebView("")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    /*
     * Send request to the big button
     *   url format: http://crashspacela.com/sign/?id=Kevin&msg=test!&type=iOS&diff_mins_max=1
     *
     */

    @IBAction func checkIn(sender: AnyObject) {
        let urlString =  "\(url)?id=\(user.text!)&msg=\(message.text!)&type=iOS&diff_mins_max=\(sliderMins.text!)&debug=1"
        
        let requestURL = NSURL(string:urlString)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    

}

