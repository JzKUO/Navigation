//
//  AttributorViewController.swift
//  firstApp
//
//  Created by 郭家政 on 2017/4/21.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import UIKit

class AttributorViewController: UIViewController {
	@IBOutlet weak var _textView: UITextView!
	@IBOutlet weak var _outlineButton: UIButton!
	@IBOutlet weak var _unoutlineButton: UIButton!
	@IBOutlet weak var _searchBar: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		self._outlineButton.layer.cornerRadius = 5
		self._unoutlineButton.layer.cornerRadius = 5
		self._outlineButton.layer.borderWidth = 1
		self._unoutlineButton.layer.borderWidth = 1
		self._outlineButton.layer.borderColor = UIColor.black.cgColor
		self._unoutlineButton.layer.borderColor = UIColor.black.cgColor
		let attribute = NSAttributedString(string: "Outline",
		                                   attributes: [NSStrokeColorAttributeName : UIColor.black,
		                                                NSForegroundColorAttributeName : UIColor.white,
		                                                NSStrokeWidthAttributeName : NSNumber(value: 4.0)])
		self._outlineButton.setAttributedTitle(attribute, for: UIControlState.normal)
		self._searchBar.placeholder = "搜尋"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func SetTextColor(_ sender: UIButton) {
		let range: NSRange = self._textView.selectedRange

		let attribute = [NSStrokeColorAttributeName : sender.backgroundColor!,
		                 NSForegroundColorAttributeName: sender.backgroundColor!]

		self._textView.textStorage.addAttributes(attribute, range: range)
	}

	@IBAction func SetTextOutline() {
		let range: NSRange = self._textView.selectedRange

		let attribute = [NSStrokeWidthAttributeName : NSNumber(value: 4.0)]

		self._textView.textStorage.addAttributes(attribute, range: range)
	}

	@IBAction func SetTextUnoutline() {
		let range: NSRange = self._textView.selectedRange

		self._textView.textStorage.removeAttribute(NSStrokeWidthAttributeName, range: range)
	}

	@IBAction func _searchBar(_ sender: UITextField) {
		//		print(sender.text!)
	}

	@IBAction func SearchText(_ sender: UIButton) {
		let paragraph: NSString = self._textView.text! as NSString
		let string: String = self._searchBar.text!
		var range: NSRange = NSMakeRange(0, paragraph.length)

		let attribute = [NSBackgroundColorAttributeName : UIColor.cyan]

		// 重置上次 highlight 的子字串
		self._textView.textStorage.removeAttribute(NSBackgroundColorAttributeName, range: range)

		while range.location != NSNotFound {
			range = paragraph.range(of: string, options: NSString.CompareOptions.caseInsensitive, range: range)
			print(range.location, range.length)
			self._textView.textStorage.addAttributes(attribute, range: range)
			range.location = range.length + range.location
			range.length = paragraph.length - range.location
		}
	}
}

