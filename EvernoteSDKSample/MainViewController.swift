//
//  MainViewController.swift
//  evernote-sdk-ios
//
//  Created by akio0911 on 2016/03/29.
//  Copyright © 2016年 Evernote Corporation. All rights reserved.
//

import Foundation
import UIKit

let PHOTO_MAX_WIDTH = 500

enum SampleFunctions: Int {
    case SaveActivity
    case UserInfo
    case TagsInfo
    case CreatePhotoNote
    case ClipWebPage
    case SearchNotes
    case ViewMyNotes
    case CustomizeNote
    
    case MaxValue
}

class MainViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    
    var tableView: UITableView! = nil
    let webView: UIWebView! = nil
    var loginItem: UIBarButtonItem! = nil
    
    override func loadView() {
        super.loadView()
        
        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        self.loginItem = UIBarButtonItem(title: nil, style: .Done, target: self, action: #selector(MainViewController.logInOrLogOut))
        self.navigationItem.rightBarButtonItem = self.loginItem
    }

    func updateLoginItem() {
        let loggedIn = ENSession.sharedSession().isAuthenticated
        self.loginItem.title = loggedIn ? NSLocalizedString("Logout", comment:"Logout") : NSLocalizedString("Login", comment:"Login")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: NSLocalizedString("Back", comment:"Back"), style: .Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        self.update()
        
        SVProgressHUD.setBackgroundColor(UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.7))
    }
    
    private func update() {
        if ENSession.sharedSession().isAuthenticated {
            self.navigationItem.title = ENSession.sharedSession().userDisplayName
        }else{
            self.navigationItem.title = nil
        }
        self.updateLoginItem()
        
        self.tableView.reloadData()
    }
    
    // ここまで終わった
    
    
    // #pragma mark - UITableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func logInOrLogOut() {
    }
    
    // #pragma mark - UIImagePickerController

    // #pragma mark - UIWebViewDelegate
    
    // #pragma mark - Customize a note
    
    

}