//
//  ViewController.swift
//  BmiApp
//
//  Created by english on 2022-09-22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtHeight: UITextField!
    
    @IBAction func txtHeightValueChanged(_ sender: UITextField) {
        lblResult.isHidden = true
    }
    
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBAction func txtWeight(_ sender: Any) {
        lblResult.isHidden = true
    }
    
    @IBOutlet weak var lblResult: UILabel!
    
    /// Abu: Calculate BMI  with given height in cm and weight in kg
    func calculateBMI(_ height : Double, _ weight : Double) -> Double
    {
        let heightInMeters : Double = height / 100
        
        let bmi : Double = weight / pow(height, 2)
        
        return round(bmi * 10) / 10
    }
    
    /// Abu: Returns Classification based on given BMI
    func getClassification(_ bmi : Double) -> (classification: String, backgroundColor: UIColor)
    {
        if (bmi < 18.5)
        {
            return ("Underweight", UIColor.blue)
        }
        else if (bmi <= 24.9)
        {
            return ("Normal weight", UIColor.green)
        }
        else if (bmi <= 29.9)
        {
            return ("Overweight", UIColor.yellow)
        }
        else if (bmi < 100 ) {
            return ("Obesity", UIColor.orange)
        }
        else {
            return ("Not Found",UIColor.lightGray)
        }
    }
    
    
    @IBAction func btnCalculatetouchUpInside(_ sender: UIButton) {
        
        guard let height = Double(txtHeight.text!), (80...250).contains(height) else {
            Toast.ok(view: self, title: "Review the height", message: "Please enter a height between 80 cm and 250 cm", handler: nil)
            return
        }
        
        guard let weight = Double(txtWeight.text!), (30...300).contains(weight) else {
            Toast.ok(view: self, title: "Review the weight", message: "Please enter a weight between 30kg and 300 kg", handler: nil)
            return
        }
        
        let bmi = calculateBMI(height, weight)
        let classification = getClassification(bmi)
        
        lblResult.text = "BMI Classification = \(classification.classification)"
        
        lblResult.backgroundColor = classification.backgroundColor

        lblResult.isHidden = false
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblResult.isHidden = true
    }


}

