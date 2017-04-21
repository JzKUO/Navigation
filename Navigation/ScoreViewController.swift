//
//  ScoreViewController.swift
//  Navigation
//
//  Created by 郭家政 on 2017/4/22.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
	@IBOutlet weak var _scoreLabel: UILabel!
	@IBOutlet weak var _timeLabel: UILabel!

	private var _score: String?
	private var _time: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self._scoreLabel.text = self._score
		self._timeLabel.text = self._time
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	public func SetScore(_ score: String) -> Void {
		self._score = score
	}

	public func SetTime(_ time: String) -> Void {
		self._time = time
	}
}
