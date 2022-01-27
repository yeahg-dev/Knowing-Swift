//
//  CEOViewController.swift
//  delegate-pattern-ARC
//
//  Created by 1 on 2022/01/27.
//

import UIKit

class CEOViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField?
    
    var delegate: Delegate?
    
    @IBAction func didTapedPreviousButton(_ sender: Any) {
        let input = inputTextField?.text
        delegate?.draw(with: input)
        self.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("💚CEOViewController deinit")
    }
    
}
