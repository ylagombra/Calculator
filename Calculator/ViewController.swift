//
//  ViewController.swift
//  Calculator
//
//  Created by ShadowZz on 2/17/16.
//  Copyright © 2016 ShadowZz. All rights reserved.
// Yardley Lagombra

import UIKit





class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Outlet variables for buttons

    
    @IBOutlet weak var lblOutput: UILabel!
    var decimalCount = false
    var firstNumber = Double()
    var secondNumber = Double()
    var result = Double()
    var operation = ""
    var typing = false
    var counter = 0
   
    
    
    @IBAction func btnClick(sender: UIButton) {
        
        
        
        // Removes Leading zero by clearing the text label
    
        if lblOutput.text == "0" || counter != 0
        {
            lblOutput.text = ""
        }
        let digit = sender.currentTitle!
        print(digit)
        
        
        
        if digit == "." && decimalCount == false{
            
             lblOutput.text = lblOutput.text! + digit
             decimalCount = true
            
        }
        
        if digit == "." && decimalCount == true
        {
            // Do nothing
        }
            
        else{
            lblOutput.text! = lblOutput.text! + digit
        }
       
            
        counter = 0
    }
    
    
    //Clear text field if CE button is pressed 
    
    @IBAction func Clear(sender: UIButton) {
        
        lblOutput.text = "0"
        decimalCount = false;
        counter = 0
        
        
    }
        
    //Function to make assigning number a negative value
    @IBAction func SignChange(sender: UIButton) {
        
        let strDisplay = lblOutput.text!
        
        let range = strDisplay.rangeOfString("-")
        
        if lblOutput.text! != "0"
        {
            if range != nil{
                lblOutput.text! =
                    String(strDisplay.characters.dropFirst())
            }else
            {
                lblOutput.text! = "-" + lblOutput.text!
            }
        }
    }
    
    //When the operation is pressed, this function stores the number as the first number
    // and casts it to a double
    
    @IBAction func Calculate(sender: UIButton) {
        
        typing = false
        operation = sender.currentTitle!
        
        //print(lblOutput.text!.integerValue)
        
        print(lblOutput.text)
        
         if let numValue = Double(lblOutput.text!)
         {
            firstNumber = numValue
            print(firstNumber)
            
        }
        
        counter++
       
       
        decimalCount = false
    
        
    }
    
    //This function takes the text on label and stores it in a variable
    // The value is cast to a float and outputted on the label
    
    @IBAction func SquareRoot(sender: UIButton) {
        
        let number = lblOutput.text!
        
         let rooted = sqrt(Float(number)!)
        
        lblOutput.text! = String(rooted)
        
        counter = 0
        decimalCount = false
        
    }
    
    
    
    // This function stores the value of the second number
    // Using the operation retrieved from the previous function
    // it produces the calculation according to the operation
        
    @IBAction func Return(sender: UIButton) {
        
        if let numValue2 = Double(lblOutput.text!)
        {
        secondNumber = numValue2
        
        }
            
            
        if operation == "+"
        {
            result = firstNumber + secondNumber
        }
        
        if operation == "-"
        {
            result = firstNumber - secondNumber
        }
        
        if operation == "×"
        {
            result = firstNumber * secondNumber
        }
        
        if operation == "÷"
        {
            result = firstNumber / secondNumber
        }
        
        lblOutput.text = "\(result)"
        
        
        
    }
    
    


    
    
}

