//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by fei on 2017/8/23.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // MARK: UIPickerView DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
    
    //行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 30
    }
    
    //列宽,默认根据列的个数自动调整
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return component == 0 ? 180 : 80
//    }
    
    //返回标题，只需要显示文字，不需要其他操作
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "\(component) -- \(row)"
//    }
    
    
    //自定义view，如果有需要自定义格式的，即非纯文字的
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if view == nil {
            let nview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
            let image = UIImageView.init(frame: CGRect(x: 3, y: 2, width: 20, height: 30))
            image.image = UIImage.init(named: "bear1")
            image.tag = 200
            image.contentMode = UIViewContentMode.scaleAspectFill
            nview.addSubview(image)
            let label = UILabel(frame: CGRect(x: 30, y: 2, width: 50, height: 30))
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = UIColor.darkGray;
            label.tag = 201
            label.text = "\(component)-\(row)"
            nview.addSubview(label)
            return nview;
        } else {
            let imageView = view?.viewWithTag(200) as! UIImageView;
            imageView.image = UIImage.init(named: "bear1")
            let label = view?.viewWithTag(201) as! UILabel
            label.text = "\(component)-\(row)"
        }
        
        return view!;
    }
    
    
    
    //滚动选择，对应item，即对应列、行，同时滚动多个列，将依次回调
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(component)-\(row)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

