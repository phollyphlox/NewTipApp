//
//  ViewController.swift
//  NewTipApp
//
//  Created by Apple28 on 4/23/18.
//  Copyright © 2018 Apple28. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var totalBill: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var sliderPercent: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sliderTip: UILabel!
    @IBOutlet weak var segmentPicker: UISegmentedControl!
    
    
    let percent = ["Select Tip Percentage", "5%", "10%", "15%", "20%", "25%"]
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.delegate = self
        pickerView.dataSource = self
        //billAmount.becomeFirstResponder()
    }

    @IBAction func billAmountReturn(_ sender: UITextField) {
        _ = sender.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return percent.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return percent[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        view.endEditing(true)
        let pickedPercent = row
        let billAmt:Double? = Double(billAmount.text!)
        if pickedPercent == 1 {
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.05)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.05)
        } else if pickedPercent == 2 {
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.10)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.10)
        } else if pickedPercent == 3 {
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.15)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.15)
        } else if pickedPercent == 4 {
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.20)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.20)
        } else if pickedPercent == 5 {
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.25)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.25)
            
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        view.endEditing(true)
        let selectedValue:Int? = Int(sender.value)
        sliderLabel.text = "\(String(describing: selectedValue!))%"
        let tip:Double? = Double(billAmount.text!)! * Double(selectedValue!) / 100
        sliderTip.text = String(format: "tip = $%.2f", tip!)
        tipAmount.text = String(format: "$%.2f", tip!)
        let billAmt:Double? = Double(billAmount.text!)
        totalBill.text = String(format: "$%.2f", tip! + billAmt!)
    }
       
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        let billAmt:Double? = Double(billAmount.text!)
        switch segmentPicker.selectedSegmentIndex
        {
        case 0:
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.05)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.05)
            break
        case 1:
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.10)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.10)
            break
        case 2:
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.15)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.15)
            break
        case 3:
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.20)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.20)
            break
        case 4:
            tipAmount.text = String(format: "$%.2f", billAmt! * 0.25)
            totalBill.text = String(format: "$%.2f", billAmt! * 1.25)
            break
        default:
            break
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        billAmount.endEditing(true)
    }
    
}

