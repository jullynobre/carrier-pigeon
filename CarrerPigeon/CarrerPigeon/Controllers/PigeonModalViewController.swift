//
//  PigeonModalViewController.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 24/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit

class PigeonModalViewController: UIViewController {

	@IBOutlet weak var capacityTextField: UITextField!
	@IBOutlet weak var timeToLoadTextField: UITextField!
	@IBOutlet weak var timeToFlyTextField: UITextField!
	@IBOutlet weak var timeToUnloadTextField: UITextField!
	
	let delegate: PigeonModalDelegate? = nil
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

	@IBAction func didTapBackButton(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func didTapDoneButton(_ sender: Any) {
		let pigeon = Pigeon(pigeonCapacity: Int(self.capacityTextField.text!)!,
							timeToLoad: Int(self.timeToLoadTextField.text!)!,
							timeToTravel: Int(self.timeToFlyTextField.text!)!,
							timeToUnload: Int(self.timeToUnloadTextField.text!)!)
		
		if self.delegate != nil {
			delegate?.createPigeon(pigeon: pigeon)
		}
	}
	
}
