//
//  ViewController.swift
//  Calculator-Funy
//
//  Created by Rahul Krishna Vasantham on 7/22/17.
//  Copyright © 2017 rahulkrnsa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    
    var operand1: Int = 0
    var operand2: Int = 0
    var operation: Operator = Operator.NOTHING
    var calcState: CalcState = CalcState.NEW_NUM_STARTED
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if self.outputLabel.text == "0"
            || self.outputLabel.text?.count == 0
            || self.calcState == CalcState.NEW_NUM_STARTED {
            self.outputLabel.text = String(sender.tag)
            self.calcState = CalcState.ENTERING_NUM
        } else {
            self.outputLabel.text = self.outputLabel.text! + String(sender.tag)
        }
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        if self.calcState == CalcState.NEW_NUM_STARTED {
            return // coming here after Division by zero error
        }
        switch sender.tag {
        case 10:
            print("add")
            self.operand1 = Int(self.outputLabel.text!)!
            self.operation = Operator.ADD
        case 11:
            print("minus")
            self.operand1 = Int(self.outputLabel.text!)!
            self.operation = Operator.SUBTACT
        case 12:
            print("divide")
            self.operand1 = Int(self.outputLabel.text!)!
            self.operation = Operator.DIVIDE
        case 13:
            print("times")
            self.operand1 = Int(self.outputLabel.text!)!
            self.operation = Operator.TIMES
        default:
            return
        }
        self.calcState = CalcState.NEW_NUM_STARTED
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        if self.calcState == CalcState.NEW_NUM_STARTED {
            return // coming here after Division by zero error
        }
        
        self.operand2 = Int(self.outputLabel.text!)!
        switch self.operation {
        case Operator.ADD: // Add
            self.operand1 += self.operand2
            self.outputLabel.text = String(self.operand1)
        case Operator.SUBTACT:
            self.operand1 -= self.operand2
            self.outputLabel.text = String(self.operand1)
        case Operator.TIMES:
            self.operand1 *= self.operand2
            self.outputLabel.text = String(self.operand1)
        case Operator.DIVIDE:
            if self.operand2 != 0 {
                self.operand1 /= self.operand2
                self.outputLabel.text = String(self.operand1)
            } else {
                self.outputLabel.text = "Err: Division by 0"
                self.calcState = CalcState.NEW_NUM_STARTED
            }
        default:
            return
        }
        self.operation = Operator.NOTHING
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

