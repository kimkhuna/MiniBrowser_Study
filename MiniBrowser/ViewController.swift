//
//  ViewController.swift
//  MiniBrowser
//
//  Created by 김경훈 on 2022/05/04.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextViewDelegate, WKNavigationDelegate, UIWebViewDelegate{
    
    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var spinningActivityIndicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialURL = "https://www.facebook.com"
        let myURL = URL(string: initialURL)
        let myRequest = URLRequest(url: myURL!)
        
        mainWebView.load(myRequest)
        urlTextField.text = initialURL
        
        
    }
    
    @IBAction func bookMarkAction(_ sender: Any) {
        
        let bookMarkURL = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "https://www.\(bookMarkURL!).com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
        mainWebView.navigationDelegate = self
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        var urlString = "\(urlTextField.text!)"
        if urlString.hasPrefix("https://"){
            urlString = "https://\(urlTextField.text!)"
        }
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
         textField.resignFirstResponder()
        return true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinningActivityIndicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinningActivityIndicatorView.stopAnimating()
    }
    
    
    @IBAction func goBackAction(_ sender: Any) {
        mainWebView.goBack()
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        mainWebView.goForward()
    }
    
    @IBAction func stopLoadingAction(_ sender: Any) {
        mainWebView.stopLoading()
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        mainWebView.reload()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

