//
//  ViewController.swift
//  FinalExam
//
//  Created by KurtHo on 2016/7/22.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
import SwiftyJSON
import SDWebImage




class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var bookArray = [BookClass]()
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func writeData(sender: AnyObject) {
        let ref = FIRDatabase.database().reference()
//        let postRef = ref.child("bookList1")
        let postRef = ref.child("bookList3")
        postRef.setValue(["uid": "1235", "title": "456768", "message": "test"])

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = FIRDatabase.database().reference()
        print("REF~~~~~ \(ref)")
        let postRef = ref.child("bookCollection")
        postRef.observeEventType(.ChildAdded, withBlock: {
            response in
//            print("book name~~~~: \(snapshot.value!.objectForKey("bookName"))")
//            print("book image~~~~: \(snapshot.value!.objectForKey("bookImage"))")
//            print("book intro~~~~: \(snapshot.value!.objectForKey("bookIntro"))")
            let book = BookClass()
            book.bookAddress = (response.value?.objectForKey("bookAddress") as? String)!
            book.bookImage = (response.value?.objectForKey("bookImage") as? String)!
            book.bookName = (response.value?.objectForKey("bookName") as? String)!
            book.bookIntro = (response.value?.objectForKey("bookIntro") as? String)!
            book.bookPhone = (response.value?.objectForKey("bookPhone") as? String)!
            print("123456~~\(book.bookAddress)")
            self.bookArray.append(book)
            if let data = response.value {
                
                print("data~~~~\(data)")
                let json = JSON(data)
                
                print("json~~~\(json)")
                let bookList = json.arrayValue
                
//似乎是json的格式有問題，bookList 是空的
                
                print("put in bookList~~~~\(bookList)")
                for book in bookList {
                    print("house name \(book["Name"].stringValue)")
                    
                    let books = BookClass()
                    books.bookName = book["bookName"].stringValue
                    books.bookAddress = book["bookAddress"].stringValue
                    books.bookImage = book["bookImage"].stringValue
                    self.bookArray.append(books)
                    
                }
            }
              self.tableView.reloadData()
            
        })
//        print("bookArray ~~ \(self.bookArray)")
//        self.tableView.reloadData()
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BookTableViewCell
            let url = NSURL(string: bookArray[indexPath.row].bookImage)

            cell.bookImage?.sd_setImageWithURL(url, placeholderImage: nil)
        
            cell.bookName.text = bookArray[indexPath.row].bookName
            return cell
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//
//    }

    
}


class BookClass {
    var bookName: String = ""
    var bookImage: String = ""
    var bookIntro: String = ""
    var bookAddress: String = ""
    var bookPhone: String = ""
}
