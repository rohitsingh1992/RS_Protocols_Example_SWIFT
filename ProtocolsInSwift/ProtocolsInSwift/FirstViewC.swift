//
//  ViewController.swift
//  ProtocolsInSwift
//
//  Created by Rohit Singh on 14/03/16.
//  Copyright © 2016 Home. All rights reserved.
//

import UIKit

class FirstViewC: UIViewController,DemoProtocol {
    
    @IBOutlet var btnFirstViewC: UIButton!
    @IBOutlet var lblFirstViewC: UILabel!
    @IBOutlet var txtFirstViewC: UITextField!
    
    var strValueGetFromSecondViewC : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     Single tab action of the UI Button
     
     - parameter sender: UIButton Object
     */
    @IBAction func tapSendValueToSecondValueC(sender: UIButton) {
        
        if self.txtFirstViewC.text?.characters.count > 0 {
            
            let obj : SecondViewC = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewC") as! SecondViewC
            obj.valueFromFirstViewC = self.txtFirstViewC.text!
            obj.delegate = self
            self.navigationController?.pushViewController(obj, animated: true)
            
        } else {
            
            let alert : UIAlertController = UIAlertController(title: "Message", message: "Please enter some value", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction) -> Void in
                
                alert.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            })
            alert.addAction(okAction)
            
            self.presentViewController(alert, animated: true, completion: { () -> Void in
                
            })
        }
    }
    
    /**
     Delegate Method of the DemoProtocol
     
     - parameter value: String value after combination
     */
    
    func sendValueFromSecondViewC(value : String) {
        self.lblFirstViewC!.text = value
    }
    
    
}

