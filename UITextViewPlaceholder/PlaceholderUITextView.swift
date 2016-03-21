//
//  PlaceholderUITextView.swift
//  WeeklyQuote
//
//  Created by Lawrence F MacFadyen on 2015-09-15.
//  Copyright © 2015 LawrenceM. All rights reserved.
//

import UIKit

@IBDesignable class PlaceholderUITextView: UIView, UITextViewDelegate {

    var view: UIView?
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelPlaceholder: UILabel!
    
    @IBInspectable var placeholderText: String = "Enter data here ..." {
        didSet {
            labelPlaceholder.text = placeholderText
        }
    }
    
    func commonXibSetup() {
        guard let view = loadViewFromNib() else
        {
            return
        }
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
        textView.delegate = self
    }
    
    func loadViewFromNib() -> UIView? {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "PlaceholderUITextView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as? UIView
        
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonXibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonXibSetup()
    }
    
    func textViewDidChange(textView: UITextView) {
        if !textView.hasText() {
            labelPlaceholder?.hidden = false
        }
        else {
            labelPlaceholder?.hidden = true
        }
    }
}
