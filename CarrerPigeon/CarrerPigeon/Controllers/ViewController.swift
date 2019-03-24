//
//  ViewController.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit
import Foundation

var boxMessagesSemaphore: DispatchSemaphore?
var boxCapacitySemaphore: DispatchSemaphore?

class ViewController: UIViewController {

	@IBOutlet weak var pigeonView: PigeonView!
	@IBOutlet weak var boxView: BoxView!
	@IBOutlet weak var writersView: WritersView!
	
    var pigeonImageAnimationIndex = 0
    let pigeonImagesNames = ["pigeon-up", "pigeon-down"]
	
	var writers: [Writer] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		boxMessagesSemaphore = DispatchSemaphore(value: 0)
		
		let pigeon = Pigeon(pigeonCapacity: 5, timeToLoad: 5, timeToTravel: 5, timeToUnload: 5)
        pigeon.run(viewController: self)
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
}
