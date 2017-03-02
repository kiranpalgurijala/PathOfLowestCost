//
//  ViewController.swift
//  PhotonCodeKata
//
//  Created by Kiranpal Reddy Gurijala on 2/21/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var matrixInputView: UITextView!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        matrixInputView.layer.borderColor = UIColor.lightGray.cgColor
        matrixInputView.layer.borderWidth = 1.0
        matrixInputView.delegate = self
        // Don't enable the button until a valid input grid has been entered
        enableButton(false)
    }

    fileprivate func enableButton(_ enabled: Bool) {
        calculateButton.isEnabled = enabled
        calculateButton.alpha = enabled ? 1 : 0.5
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if !["0","1","2","3","4","5","6","7","8","9"," ","\n","","-"].contains(text) {
            // Dismiss the keyboard on an invalid key press
            textView.resignFirstResponder()
            
        }
        // Only enable the button if the current input is valid
        enableButton(validate(textView.text))
        return true
    }
    @IBAction func done(_ sender: Any) {
         matrixInputView.resignFirstResponder()
    }

    
    @IBAction func pressed(_ sender: UIButton) {
        let parser = InputElementParser()
        let matrix = parser.parse(matrixInputView.text)
        let finder = LowCostPathFinder()
        let result = finder.findPath(matrix)
        show(result)
    }
    


    fileprivate func show(_ result: (Bool, Int, Array<Int>)) {
        let (success, resistance, path) = result
        
        var message = success ? "Yes" : "No"
        message += "\n" + String(resistance)
        message += "\n" + path.map(){x in String(x)}.joined(separator: " ")
        
        // create the alert
        let alert = UIAlertController(title: "Low cost path", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    // Validates whether the current input is a valid grid
    fileprivate func validate(_ input: String) -> Bool {
        var width: Int!
        let rows = input.components(separatedBy: "\n")
        for row in rows {
            let items = row.components(separatedBy: " ")
            if width == nil {
                width = items.count
            }
            if items.count != width {
                return false
            }
            for item in items {
                if Int(item) == nil {
                    return false
                }
            }
        }
        return width != nil
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

