//
//  SecondViewC.swift
//  ProtocolsInSwift
//
//  Created by Rohit Singh on 14/03/16.
//  Copyright © 2016 Home. All rights reserved.
//

import UIKit

protocol MySecondProtocol{
    func sendValueFromSecondViewC(value : String);
}

class SecondViewC: UIViewController {
    
    var valueFromFirstViewC : String?
    
    @IBOutlet var btnSecondViewC: UIButton!
    @IBOutlet var lblSecondViewC: UILabel!
    @IBOutlet var txtSecondViewC: UITextField!
    //  var delegate : MySecondProtocol?
    
    var delegate : DemoProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblSecondViewC.text = valueFromFirstViewC
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     Single Tap Action of UIButton
     
     - parameter sender: UIButton Object
     */
    
    @IBAction func tapSendValueToFirstValueC(sender: UIButton) {
        
        if self.txtSecondViewC.text?.characters.count > 0{
            
            delegate?.sendValueFromSecondViewC(String(format: "%@ %@",  self.txtSecondViewC.text!,self.valueFromFirstViewC!))
            self.navigationController?.popViewControllerAnimated(true)
            
            
            
            
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
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
