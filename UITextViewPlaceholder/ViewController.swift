//
//  ViewController.swift
//  UITextViewPlaceholder
//
//  Created by Lawrence F MacFadyen on 2016-03-20.
//  Copyright © 2016 LawrenceM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    // Bottom height constraint value is based on whether keyboard is showing
    // Note: Using UIKeyboardFrameEndUserInfoKey for iOS 11 and Swift 4
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomHeight.constant = keyboardSize.height
        }
    }
    
    func keyboardWillHide(_ notification: Notification){
        // No keyboard, so bottomHeight back to 0
        bottomHeight.constant = 0.0
    }
    
}

