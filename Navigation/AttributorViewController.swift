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

	private var coloredCharacterAmount = 0
	private var outlinedCharacterAmount = 0

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

	// 掃描每個字元的屬性
	func ScanAttributedCharacters() -> Void {
		let paragraph: NSString = self._textView.text! as NSString
		var range: NSRange = NSMakeRange(0, paragraph.length)
		self.coloredCharacterAmount = 0
		self.outlinedCharacterAmount = 0
		for i in 0..<paragraph.length {
			if self._textView.textStorage.attribute(NSForegroundColorAttributeName, at: i, effectiveRange: &range) != nil {
				self.coloredCharacterAmount += 1
			}
			if self._textView.textStorage.attribute(NSStrokeWidthAttributeName, at: i, effectiveRange: &range) != nil {
				self.outlinedCharacterAmount += 1
			}
		}
	}

	// 將 data 傳到下個 view
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		self.ScanAttributedCharacters()
		if segue.identifier == "push" {
			(segue.destination as! DetailsViewController).SetColorizedCharactersAmount(self.coloredCharacterAmount)
			(segue.destination as! DetailsViewController).SetOutlinedCharactersLabelAmount(self.outlinedCharacterAmount)
		}
	}
}

