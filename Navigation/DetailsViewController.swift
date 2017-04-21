//
//  DetailsViewController.swift
//  Navigation
//
//  Created by 郭家政 on 2017/4/22.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
	@IBOutlet weak var _colorizedCharactersLabel: UILabel!
	@IBOutlet weak var _outlinedCharactersLabel: UILabel!

	private var _colorizedCharactersAmount: String?
	private var _outlinedCharactersLabelAmount: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self._colorizedCharactersLabel.text = self._colorizedCharactersAmount
		self._outlinedCharactersLabel.text = self._outlinedCharactersLabelAmount

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	public func SetColorizedCharactersAmount(_ amount: Int) -> Void {
		self._colorizedCharactersAmount = String(amount)
	}

	public func SetOutlinedCharactersLabelAmount(_ amout: Int) -> Void {
		self._outlinedCharactersLabelAmount = String(amout)
	}
}
