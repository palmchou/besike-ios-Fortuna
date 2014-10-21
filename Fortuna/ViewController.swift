//
//  ViewController.swift
//  Fortuna
//
//  Created by Palm on 21/10/2014.
//  Copyright (c) 2014 Palm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quotationTextView: UITextView!
    
    @IBAction func RootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuotes()
    }
    
    var delegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = UIApplication.sharedApplication().delegate as AppDelegate
        quotationTextView.editable = false
        quotationTextView.selectable = false
        displayRandomQuotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayRandomQuotes() {
        var quotes: [String]
        if arc4random_uniform(2) == 0 {
            quotes = delegate.positiveQuotes
        } else {
            quotes = delegate.negativeQuotes
        }
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        let quote = quotes[index]
        quotationTextView.text = quote
    }

}

