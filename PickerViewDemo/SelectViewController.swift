
//
//  SelectViewController.swift
//  PickerViewDemo
//
//  Created by fei on 2017/8/23.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController,BottomSelectViewDelegate,BottomDateSelectViewDelegate,BottomRelateDataSelectViewDelete {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        let date = NSDate(timeIntervalSince1970: 0)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/mm/dd hh:mm:dd"
        print(formatter.string(from: date as Date))
        
        print(formatter.string(from: NSDate.init(timeIntervalSinceNow: 0) as Date))
        
    }
    @IBAction func showButtonClicked(_ sender: UIButton) {
        let view = BottomSelectView();
        var array = Array<SelectItemModel>()
        for i in 1...20 {
            let item = SelectItemModel()
            item.itemId = "\(i)"
            item.itemName = "T\(i*i)"
            array.append(item)
        }
        view.delegate = self;
        view.dataArray_First = array
//        view.dataArray_Second = array
        view .showWithAnimation(animate: true)
    }

    @IBAction func showDatePickerClicked(_ sender: Any) {
        let view = BottomDateSelectView()
        view.delegate = self;
        view.showWithAnimation(animate: true);
        
    }
    
    @IBAction func showRelateDataViewClicked(_ sender: Any) {
        let fArray = ["北京","长白山","蜀山","黄山","崇山"];
        
        
        let view = BottomRelateDataSelectView()
        var array = Array<Dictionary<String,Array<String>>>()
        for string in fArray {
            var sArray = Array<String>()
            for i in 1...20 {
                let sS = "\(string)00\(i)"
                sArray.append(sS)
            }
            array.append([string:sArray])
        }
        view.dataSourceArray = array
        view.delegate = self;
        view.showWithAnimation(animate: true)
        
    }
    
    @IBAction func showPopViewClicked(_ sender: Any) {
        
        let alertV = UIAlertController.init(title: "提示", message: "内容", preferredStyle: UIAlertControllerStyle.alert)
        
        let sureAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default) { (action) in
            
        }
        alertV.addAction(sureAction)
        self.show(alertV, sender: nil);
        
        
    }
    // MARK: BottomRelateDataSelectView delegate
    func bottomRelateDataSelectView(selectView: BottomRelateDataSelectView, didSelectFirst fIndex: NSInteger, second sIndex: NSInteger) {
        print(fIndex,sIndex)
    }
    
    // MARK: BottomDateSelectView Delegate
    func bottomDateSelectView(bottomView: BottomDateSelectView, didSelectDate date: NSDate) {
        print(date)
    }
    
    // MARK: BottomSelectView Delegate
    func bottomSelctView(selectView: BottomSelectView, didSelectFirstIndex index: NSInteger) {
        print(index)
    }
    
    func bottomSelctView(selectView: BottomSelectView, didSelectFirstIndex index: NSInteger, secondIndex sIndex: NSInteger) {
        print(index,sIndex)
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
