//
//  DateViewController.swift
//  PickerViewDemo
//
//  Created by fei on 2017/8/23.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet var datePickerView: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func datePickerViewDateChanged(_ sender: UIDatePicker) {
        
        
        print(datePickerView.date)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
