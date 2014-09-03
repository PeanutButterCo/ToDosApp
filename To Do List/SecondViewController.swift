//
//  SecondViewController.swift
//  To Do List
//
//  Created by Pablo on 31/08/14.
//  Copyright (c) 2014 Pablo. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, UITextFieldDelegate {
                            
    @IBOutlet weak var toDoField: UITextField!
    
    // Add Btn is pressed
    @IBAction func addToDo(sender: UIButton) {
        if toDoField.text != ""{
            toDos.append(toDoField.text)
            self.view.endEditing(true)
            toDoField.text=""
            saveToDoList(toDos)
        }
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //toDoField.frame = CGRectMake(toDoField.frame.origin.x, toDoField.frame.origin.y, toDoField.frame.size.height, toDoField.frame.size.width)
        toDoField.borderStyle = .RoundedRect;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        // Hides keyboard when "done key is pressed"
        toDoField.resignFirstResponder()
        return true
    }
    
    // view is touched
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        // hides keyboard
        self.view.endEditing(true)
    }
}

