//
//  ViewController.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit
import Foundation

var boxMessagesSemaphore: DispatchSemaphore? = DispatchSemaphore(value: 0)
var boxCapacitySemaphore: DispatchSemaphore?

class ViewController: UIViewController {

	@IBOutlet weak var pigeonView: PigeonView!
	@IBOutlet weak var boxView: BoxView!
	@IBOutlet weak var writersView: WritersView!
	
	@IBOutlet weak var addPigeonButton: UIButton!
	@IBOutlet weak var configureBoxButton: UIButton!
	@IBOutlet weak var addWriterButton: UIButton!
	
	@IBOutlet weak var runButton: UIBarButtonItem!
	
	var pigeonImageAnimationIndex = 0
    let pigeonImagesNames = ["pigeon-up", "pigeon-down"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		disableButtons()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "PigeonModalDelegate" {
			let vc: PigeonModalViewController = segue.destination as! PigeonModalViewController
			vc.delegate = self
		} else if segue.identifier == "BoxModalDelegate" {
			let vc: BoxModalViewController = segue.destination as! BoxModalViewController
			vc.delegate = self
		} else if segue.identifier == "WriterModalDelegate" {
			let vc: WriterModalViewController = segue.destination as! WriterModalViewController
			vc.delegate = self
		}
	}
	
	func disableButtons() {
		self.addPigeonButton.isEnabled = false
		self.addWriterButton.isEnabled = false
		self.runButton.isEnabled = false
	}
}
