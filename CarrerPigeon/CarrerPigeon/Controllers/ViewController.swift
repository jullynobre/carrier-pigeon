//
//  ViewController.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 14/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

	@IBOutlet weak var pigeonView: PigeonView!
	@IBOutlet weak var boxView: BoxView!
	@IBOutlet weak var writersView: WritersView!
	
    var pigeonImageAnimationIndex = 0
    let pigeonImagesNames = ["pigeon-up", "pigeon-down"]
	
	var writers: [Writer] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let testSemaphore = DispatchSemaphore(value: 1)
        
        let pigeon = Pigeon(boxMessagesSemaphore: testSemaphore, boxCapacitySemaphore: testSemaphore, pigeonCapacity: 5, timeToLoad: 5, timeToTravel: 5, timeToUnload: 5)
        pigeon.run(viewController: self)
	}

}
