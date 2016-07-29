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
    let books = BookClass()
    let reFreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func writeData(sender: AnyObject) {
        let ref = FIRDatabase.database().reference()
//        let postRef = ref.child("bookList1")
        let postRef = ref.child("bookList3")
        postRef.setValue(["uid": "1235", "title": "456768", "message": "test"])

    }
    
    @IBOutlet weak var addBook: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reFreshControl.addTarget(self, action: #selector(ViewController.refresh), forControlEvents: .ValueChanged)
        self.tableView.addSubview(reFreshControl)
        
        
        
//refresh
        
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
            book.bookWeb = (response.value?.objectForKey("bookWeb") as? String)!
            
            self.bookArray.append(book)
            if let data = response.value {
                
                print("data~~~~\(data)")
                let json = JSON(data)
                
                print("json~~~\(json)")
                let bookList = json.arrayValue
                
                
                print("put in bookList~~~~\(bookList)")
                for book in bookList {
                    print("house name \(book["Name"].stringValue)")
                    
                    self.books.bookName = book["bookName"].stringValue
                    self.books.bookAddress = book["bookAddress"].stringValue
                    self.books.bookImage = book["bookImage"].stringValue
                    self.books.bookPhone = book["bookPhone"].stringValue
                    self.books.bookIntro = book["bookIntro"].stringValue
                    self.books.bookWeb = book["bookWeb"].stringValue
                    self.bookArray.append(self.books)
                    
                }
            }
              self.tableView.reloadData()
            
        })

    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
//    refresh
    
    func refresh() {
        self.tableView.reloadData()
        self.reFreshControl.endRefreshing()
    }
    
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath) as! BookTableViewCell
            let url = NSURL(string: bookArray[indexPath.row].bookImage)
        
        
        
        cell.bookImage?.sd_setImageWithURL(url, placeholderImage: nil)
            cell.bookName.text = bookArray[indexPath.row].bookName
            return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            bookArray.removeAtIndex(indexPath.row)
        }
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Cell" {
            let vc = segue.destinationViewController as! DetailBookTableViewController
            vc.bookArray = bookArray
            
        }
    }

    
    
    
    
}


class BookClass {
    var bookName: String = ""
    var bookImage: String = ""
    var bookIntro: String = ""
    var bookAddress: String = ""
    var bookPhone: String = ""
    var bookWeb: String = ""

}
