//
//  ViewController.swift
//  HelloNotification
//
//  Created by 胡靜諭 on 2018/1/23.
//  Copyright © 2018年 胡靜諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //註冊「我在意鍵盤即將升起的通知」
        NotificationCenter.default.addObserver(self, selector: #selector (moveTextFieldUP(aNotification: )), name: .UIKeyboardWillShow, object: nil)
    }
    
    //當鍵盤即將升起時會執行的方法
    @objc func moveTextFieldUP(aNotification: Notification){
        //取出詳情
        let info = aNotification.userInfo
        //取出尺寸
        let sizeValue = info![UIKeyboardFrameEndUserInfoKey] as! NSValue
        //將尺寸值轉換為 CGSize
        let size = sizeValue.cgRectValue.size
        //拿出高度
        let height = size.height
        //把底部的距離改為0
        bottomConstraint.constant = -height
        //利用動畫增加延遲感
        UIView.animate(withDuration: 25) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        bottomConstraint.constant = 0
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}




