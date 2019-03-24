//
//  BoxModalViewController.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 24/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit

class BoxModalViewController: UIViewController {

	@IBOutlet weak var capacityTextField: UITextField!
	
	let delegate: BoxModalDelegate? = nil
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	@IBAction func didTapBackButton(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func didTapDoneButton(_ sender: Any) {
		delegate?.setBoxCapacity(capacity: Int(self.capacityTextField.text!)!)
	}

}
