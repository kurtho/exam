//
//  AddBookViewController.swift
//  FinalExam
//
//  Created by KurtHo on 2016/7/22.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import SwiftyJSON
import SDWebImage
import WebKit


class AddBookViewController: UIViewController {

    @IBOutlet weak var nameTextView: UITextField!

    @IBOutlet weak var addressTextView: UITextField!
    
    @IBOutlet weak var ImageTextView: UITextField!
    
    @IBOutlet weak var phoneTextView: UITextField!
    
    @IBOutlet weak var webTextView: UITextField!
    
    @IBOutlet weak var introTextView: UITextField!
    
    @IBAction func updateButton(sender: AnyObject) {
        let ref = FIRDatabase.database().reference()
        let postRef = ref.child("bookCollection").childByAutoId()
        postRef.setValue(["bookAddress": addressTextView.text! , "bookImage": ImageTextView.text!, "bookIntro": introTextView.text! , "bookName": nameTextView.text!, "bookPhone": phoneTextView.text!, "bookWeb": webTextView.text!
            ])
    }
    
    @IBAction func phoneCall(sender: AnyObject) {

    }
    
    
    @IBAction func map(sender: AnyObject) {
    }
    
    @IBOutlet weak var web: UIButton!

    
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
