//
//  ViewController.swift
//  contact_app
//
//  Created by AJ on 5/29/16.
//  Copyright © 2016 AJ. All rights reserved.

// Author : Jadhav Amarnath and Amit Kumar

import UIKit
import Foundation


class ViewController: UIViewController {
    
    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var EmailLbl: UILabel!
    @IBOutlet weak var NumberLbl: UILabel!
    
    var infor: Array<JSON>?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Details"
        
        
        let filePath = NSBundle.mainBundle().pathForResource("data", ofType:"json")
        let data = NSData(contentsOfFile:filePath!)
        do {
            let parsedObject: AnyObject? = try
                NSJSONSerialization.JSONObjectWithData(data!,options:
                    NSJSONReadingOptions.AllowFragments)
            if (parsedObject as? NSDictionary) != nil {
                
                NameLbl.text = String (infor![0])
                EmailLbl.text = String (infor![1])
                NumberLbl.text = String (infor![2])
                
                }
        } catch  {
            
            print("Your code is error")
            
        }
        
        
    }
        
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
