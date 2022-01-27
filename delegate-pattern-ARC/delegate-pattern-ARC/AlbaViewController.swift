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
        //        let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        //        guard let nextVC = storyboard?.instantiateViewController(identifier: "CEOViewController") as? CEOViewController else { return }
        //        nextViewController = nextVC
        //        nextVC.delegate = self as Delegate
    }
    
    func draw(with string: String?) {
        printLabel?.text = string
    }
    
    @IBAction func didTappedNext(_ sender: Any) {
        let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let nextVC = storyboard?.instantiateViewController(identifier: "CEOViewController") as? CEOViewController else {return}
//        이 메서드가 호출이 끝나면 Count도 -1? 되는 것 같다.
        nextVC.delegate = self as Delegate
//        nextViewController가 CEO인스턴스 RC +1 해주는데,
//        이 메서드가 또 불릴 때 기존의 CEO인스턴스 RC -1되면서 결국 RC가 0이되어 CEO인스턴스는 deinit된다
//        nextViewController = nextVC
        
        present(nextVC, animated: true, completion: nil)
    }
    
    deinit {
        print("💜AlbaViewController deinit")
    }
    
}

