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
	
	var pigeonImageAnimationIndex = 1
    let pigeonImagesNames = ["pigeon-up", "pigeon-down"]
    
    var pigeonThread: Pigeon?
	
	override func viewDidLoad() {
		super.viewDidLoad()
    
    self.writersView.collectionView.delegate = self
    
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
	
	@IBAction func didTapPigeonView(_ sender: Any) {
		guard let pigeon = self.pigeonThread else { return }
		
		let alert = UIAlertController(title: "Libertar pombo", message: "Tem certeza de que você quer libertar o pombo na natureza? Essa ação é irreversível.", preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: "Libertar", style: .destructive, handler: {alert in
            pigeon.releasePigeon()
		}))
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		
		self.present(alert, animated: true, completion: nil)
	}
}

extension ViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let writer = self.writersView.writers[indexPath.row]
		
        if (writer.isFired) {
            writer.isFired = false
            writer.rerun(viewController: self)
            writersView.collectionView.reloadItems(at: [IndexPath(row: writer.writerCellIndex!, section: 0)])
        } else {
            let alert = UIAlertController(title: "Demitir \(writer.id)", message: "Tem certeza de que você quer demitir o escritor selecionado? Essa ação é irreversível.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Demitir", style: .destructive, handler: {alert in
                writer.isFired = true
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
	}
}
