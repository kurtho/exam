//
//  AddBookViewController.swift
//  FinalExam
//
//  Created by KurtHo on 2016/7/22.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    @IBOutlet weak var nameTextView: UITextField!

    @IBOutlet weak var addressTextView: UITextField!
    
    @IBOutlet weak var ImageTextView: UITextField!
    
    @IBOutlet weak var phoneTextView: UITextField!
    
    @IBOutlet weak var webTextView: UITextField!
    
    
    @IBAction func updateButton(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
