//
//  BaseViewController.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/20/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController{
    var myActivityIndicator: UIActivityIndicatorView!
    var viewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        self.myActivityIndicator.center = view.center
        view.addSubview(self.myActivityIndicator)
        view.backgroundColor = UIColor(hex:0x007AFF)
    }
    
    func showAlert(message: String, title: String) {
        //Action buttons
        let okAction = UIAlertAction(title: Constants.ok, style: .cancel) { (action) in
            print(Constants.ok)
        }
        
        //Create and configure the alert controller
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
        self.myActivityIndicator.stopAnimating()
        
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.layer.cornerRadius = NumberCodeCGF.one.rawValue
        subview.backgroundColor = UIColor(red: (NumberCodeCGF.twoHundredFifty.rawValue/NumberCodeCGF.twoHundredFiftyFive.rawValue),
                                          green: (NumberCodeCGF.twoHundredFifty.rawValue/NumberCodeCGF.twoHundredFiftyFive.rawValue),
                                          blue: (NumberCodeCGF.twoHundredFifty.rawValue/NumberCodeCGF.twoHundredFiftyFive.rawValue),
                                          alpha: NumberCodeCGF.one.rawValue)
    }
    
    func showNextView(storyboardName: String){
        let sbView = UIStoryboard(name: storyboardName, bundle: nil)
        let vcView : UIViewController? = sbView.instantiateInitialViewController()
        if let vcView = vcView {
            present(vcView, animated: true)
        }
    }
    
    func addBackground(){
        if let image = UIImage(named: Constants.iBackground){
            view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    func setOkbutton() -> UIToolbar {
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: NumberCodeCGF.zero.rawValue, y: NumberCodeCGF.zero.rawValue,  width: self.view.frame.size.width, height: NumberCodeCGF.thirty.rawValue))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(BaseViewController.doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        return toolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    func colorBoder() -> UIColor{
        return UIColor(red: (213/NumberCodeCGF.twoHundredFiftyFive.rawValue),
                       green: (179/NumberCodeCGF.twoHundredFiftyFive.rawValue),
                       blue: (229/NumberCodeCGF.twoHundredFiftyFive.rawValue),
                       alpha: NumberCodeCGF.one.rawValue)
    }
    
    func setupWidthCell(cellWidth : CGFloat, cellMargin : CGFloat) -> CGFloat {
        let estimatedWidth = CGFloat(cellWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width) / estimatedWidth)
        
        let margin = CGFloat(cellMargin * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMargin) * (cellCount - 1) - margin) / cellCount
        return width
    }
    
    func setHeaderView(_ viewcontroller: UIViewController, headerView: HeaderView){
        self.viewController = viewcontroller
        headerView.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

@IBDesignable extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
@IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
   }
    
@IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

extension BaseViewController: HeaderViewDelegate {
    func backButton(sender: UIButton) {
        backButtonAction()
    }
    
    @objc func backButtonAction(){
           self.viewController!.dismiss(animated: true, completion: nil)
       }
}


