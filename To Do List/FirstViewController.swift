//
//  FirstViewController.swift
//  To Do List
//
//  Created by Pablo on 31/08/14.
//  Copyright (c) 2014 Pablo. All rights reserved.
//

import UIKit

var toDos:[NSString]=[]

func saveToDoList ( newToDos : [NSString] ){
    let updatedToDos = newToDos;
    NSUserDefaults.standardUserDefaults().setObject(updatedToDos, forKey: "ToDoList")
    NSUserDefaults.standardUserDefaults().synchronize()
}

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var toDosTable:UITableView?
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        //println("count:")
        //println(toDos.count)
        return toDos.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell\(indexPath.row)")
        cell.textLabel.text = toDos[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        println("viewWillAppear")
        if var storedToDoList: [NSString] = NSUserDefaults.standardUserDefaults().objectForKey("ToDoList") as? [NSString]{
            toDos = storedToDoList;
        }
        toDosTable?.reloadData()    
    }
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        if editingStyle == .Delete {
            if indexPath != nil{
                toDos.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                println("")
                println("good")
            }else{
                println("nillllll")
            }
        }
    }
}


