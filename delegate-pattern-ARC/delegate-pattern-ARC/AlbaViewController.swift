//
//  ViewController.swift
//  delegate-pattern-ARC
//
//  Created by 1 on 2022/01/27.
//

import UIKit

protocol Delegate: AnyObject {
    
    func draw(with: String?)
}

class AlbaViewController: UIViewController, Delegate {
    
    @IBOutlet weak var printLabel: UILabel?
    @IBOutlet weak var nextButton: UIButton?
    
    // 프로퍼티로 가지고 있을 경우에 강한 순환참조 문제가 발생
    private var nextViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // ☑️case: 강한 순환 참조로 CEO뷰컨 인스턴스가 deinit되지 않는 상황 재연
        let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let nextVC = storyboard?.instantiateViewController(identifier: "CEOViewController") as? CEOViewController else { return }
        nextViewController = nextVC
        nextVC.delegate = self as Delegate
    }
    
    func draw(with string: String?) {
        printLabel?.text = string
    }
    
    @IBAction func didTappedNext(_ sender: Any) {
        present(nextViewController!, animated: true, completion: nil)
    }
    
    deinit {
        print("💜AlbaViewController deinit")
    }
    
}

