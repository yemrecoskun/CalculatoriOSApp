//
//  ViewController.swift
//  Calculator
//
//  Created by yunus emre coşkun on 25.03.2021.
//  Copyright © 2021 yunus emre coşkun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var calculator: UILabel!
    @IBOutlet weak var commas: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var theme: UISegmentedControl!
    var pon = false
    var operation = ""
    var firstNumber = ""
    var isCalculatorAvailable = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func themeButton(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 1 {
            theme.backgroundColor = .black
            view.backgroundColor = .black
            themeChange(value: .white)
        }
        else if sender.selectedSegmentIndex == 0 {
            theme.backgroundColor = .white
            view.backgroundColor = .white
            themeChange(value: .black)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func zeroButton(_ sender: Any) {
        if label.text != "0"
        {
            label.text?.append("0")
        }
    }
    @IBAction func oneButton(_ sender: Any) {
        newLabelText(value: "1")
    }
    @IBAction func twoButton(_ sender: Any) {
        newLabelText(value: "2")
    }
    @IBAction func threeButton(_ sender: Any){
        newLabelText(value: "3")
    }
    @IBAction func fourButton(_ sender: Any) {
        newLabelText(value: "4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        newLabelText(value: "5")
    }
    @IBAction func sixButton(_ sender: Any) {
        newLabelText(value: "6")
    }
    @IBAction func sevenButton(_ sender: Any) {
        newLabelText(value: "7")
    }
    @IBAction func eightButton(_ sender: Any) {
        newLabelText(value: "8")
    }
    @IBAction func nineButton(_ sender: Any) {
        newLabelText(value: "9")
    }
    @IBAction func commasButton(_ sender: Any) {
        //if !label.text.contains(".")
        //{
            label.text?.append(".")
        //}
    }
    @IBAction func clearText(_ sender: Any) {
        label.text="0"
        isCalculatorAvailable = false
    }
    @IBAction func clearButton(_ sender: Any) {
        label.text="0"
        firstNumber = ""
        operation = ""
        calculator.text = "0"
        isCalculatorAvailable = false
    }
    @IBAction func ponButton(_ sender: Any) {
        if(pon){
            label.text = String(label.text!.dropFirst())
            pon = false
        }
        else{
            label.text = "-"+label.text!
            pon = true
        }
    }
    @IBAction func percentateButton(_ sender: Any) {
        label.text = String(Double(label.text!)! / 100.0)
    }
    @IBAction func divisionButton(_ sender: Any) {
        operationButton(value: "/")
    }
    @IBAction func multiplicationButton(_ sender: Any) {
        operationButton(value: "*")
    }
    @IBAction func subtractionButton(_ sender: Any) {
        operationButton(value: "-")
    }
    @IBAction func additionButton(_ sender: Any) {
        operationButton(value: "+")
    }
    @IBAction func resultButton(_ sender: Any) {
        operationResult()
        operation = ""
    }
    func newLabelText(value: String){
        if label.text=="0"
        {
            label.text=value
        }
        else
        {
            label.text?.append(value)
        }
        isCalculatorAvailable = true
    }
    func operationButton(value: String){
        if isCalculatorAvailable {
        if operation != ""
        {
            operationResult()
        }
        operation = value
        firstNumber = label.text!
        label.text = "0"
        isCalculatorAvailable = false
        }
        else{
            operation = value
        }
    }
    func operationResult(){
        switch operation {
        case "/":
            let result = String(Double(firstNumber)! / Double(label.text!)!)
            calculator.text = String(firstNumber + "/" + label.text! + "=" + result)
            label.text = result
            break
        case "*":
            let result = String(Double(firstNumber)! * Double(label.text!)!)
            calculator.text = String(firstNumber + "*" + label.text! + "=" + result)
            label.text = result
            break
        case "+":
            let result = String(Double(firstNumber)! + Double(label.text!)!)
            calculator.text = String(firstNumber + "+" + label.text! + "=" + result)
            label.text = result
            break
        case "-":
            let result = String(Double(firstNumber)! - Double(label.text!)!)
            calculator.text = String(firstNumber + "-" + label.text! + "=" + result)
            label.text = result
            break
        default : break
        }
    }
    func themeChange(value : UIColor){
        label.textColor = value
        calculator.textColor = value
        commas.titleLabel?.textColor = value
        zero.titleLabel?.textColor = value
        one.titleLabel?.textColor = value
        two.titleLabel?.textColor = value
        three.titleLabel?.textColor = value
        four.titleLabel?.textColor = value
        five.titleLabel?.textColor = value
        six.titleLabel?.textColor = value
        seven.titleLabel?.textColor = value
        eight.titleLabel?.textColor = value
        nine.titleLabel?.textColor = value
    }
}

