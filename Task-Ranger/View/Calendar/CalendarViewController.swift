//
//  CalendarViewController.swift
//  Task-Ranger
//
//  Created by ericzero on 1/22/23.
//

import UIKit
import SnapKit

class CalendarViewController: UIViewController {
    
    lazy var addTaskLbl: UILabel = {
        let addTaskLbl  = UILabel()
        addTaskLbl.numberOfLines = 1
        addTaskLbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        addTaskLbl.textAlignment = .center
        addTaskLbl.text = "Add Task"
        addTaskLbl.textColor = .white
        return addTaskLbl
    }()
    
    lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        return backView
    }()
    
    lazy var startLbl: UILabel = {
        let startLbl = UILabel()
        startLbl.text = "Start"
        startLbl.textColor = UIColor(named: "baseBlueColor")
        startLbl.font = .systemFont(ofSize: 14, weight: .medium)
        return startLbl
    }()
    
    lazy var endLbl: UILabel = {
        let endLbl = UILabel()
        endLbl.text = "Ends"
        endLbl.textColor = UIColor(named: "baseBlueColor")
        endLbl.font = .systemFont(ofSize: 14, weight: .medium)
        return endLbl
    }()
    
    let startBtnBorderColor = UIColor(red: 238/255, green: 245/255, blue: 253/255, alpha: 1)
    
    lazy var startBtn: UIButton = {
        let startBtn = UIButton(type: .system)
        startBtn.setTitle("Start", for: .normal)
        startBtn.setImage(UIImage(named: "Vector1"), for: .normal)
        startBtn.clipsToBounds = true
        startBtn.layer.cornerRadius = 10
        startBtn.layer.borderWidth = 1
        startBtn.layer.borderColor = startBtnBorderColor.cgColor
        startBtn.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
        return startBtn
    }()
    
    lazy var endBtn: UIButton = {
        let endBtn = UIButton(type: .system)
        endBtn.setTitle("Ends", for: .normal)
        endBtn.setImage(UIImage(named: "Vector1"), for: .normal)
        endBtn.layer.cornerRadius = 10
        endBtn.layer.borderWidth = 1
        endBtn.layer.borderColor = startBtnBorderColor.cgColor
        endBtn.addTarget(self, action: #selector(endsBtnTapped), for: .touchUpInside)
        return endBtn
    }()
    
    lazy var titleLbl: UILabel = {
        let titleLbl = UILabel()
        titleLbl.text = "Title"
        titleLbl.textColor = UIColor(named: "baseBlueColor")
        titleLbl.font = .systemFont(ofSize: 14, weight: .medium)
        return titleLbl
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your task"
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = startBtnBorderColor.cgColor
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var descriptionLbl: UILabel = {
        let descriptionLbl = UILabel()
        descriptionLbl.text = "Description"
        descriptionLbl.textColor = UIColor(named: "baseBlueColor")
        descriptionLbl.font = .systemFont(ofSize: 14, weight: .medium)
        return descriptionLbl
    }()
    
    let textViewPlaceholder = "Describe your task"
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = startBtnBorderColor.cgColor
        textView.text = textViewPlaceholder
        textView.textColor = .lightGray
        
        return textView
    }()
    
    lazy var createBtn: UIButton = {
        let createBtn = UIButton(type: .system)
        createBtn.setTitle("Create", for: .normal)
        createBtn.layer.cornerRadius = 10
        createBtn.backgroundColor = UIColor(named: "baseBlueColor")
        createBtn.setTitleColor(.white, for: .normal)
        createBtn.addTarget(self, action: #selector(createBtnTapped), for: .touchUpInside)
        return createBtn
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.isHidden = true
        //datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        //datePicker.backgroundColor = .red
//        datePicker.frame.size = CGSize(width: 0, height: 400)
//        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    let calendarView = CustomAlert()
        
    @objc func createBtnTapped(){
        
    }
    
    var isStartBtnSelected = false
    var isEndBtnSelected = false
    
    @objc func startBtnTapped(){
        
        datePickerDoneBtn()
        
        if !isStartBtnSelected {
            startBtn.backgroundColor = UIColor(named: "CalendarBtnColor")
            endBtn.backgroundColor = .white
            isStartBtnSelected = true
            isEndBtnSelected = false
        } else {
            startBtn.backgroundColor = .white
            isStartBtnSelected = false
        }
    }
    
    func datePickerDoneBtn(){
        calendarView.center = self.view.center
        calendarView.frame = CGRect(x: 50, y: 200, width: 300, height: 370)
        self.view.addSubview(calendarView)
        calendarView.delegate = self
    }
    
    func datePickerDoneBtn2(){
        calendarView.center = self.view.center
        calendarView.frame = CGRect(x: 50, y: 200, width: 300, height: 370)
        self.view.addSubview(calendarView)
        calendarView.delegate = self
    }
 
    @objc func endsBtnTapped(){
        datePickerDoneBtn2()
        if !isEndBtnSelected {
            endBtn.backgroundColor = UIColor(named: "CalendarBtnColor")
            startBtn.backgroundColor = .white
            isEndBtnSelected = true
            isStartBtnSelected = false
        } else {
            endBtn.backgroundColor = .white
            isEndBtnSelected = false
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "baseBlueColor")
        setUp()
    }
    
    func setUp(){
        view.addSubview(addTaskLbl)
        view.addSubview(backView)
        backView.addSubview(startLbl)
        backView.addSubview(endLbl)
        backView.addSubview(startBtn)
        backView.addSubview(endBtn)
        backView.addSubview(titleLbl)
        backView.addSubview(textField)
        backView.addSubview(descriptionLbl)
        backView.addSubview(textView)
        backView.addSubview(createBtn)
        
        addTaskLbl.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        backView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.8)
        }
        
        backView.layer.cornerRadius = 50
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        startLbl.snp.makeConstraints { make in
            make.top.equalTo(33)
            make.left.equalTo(21)
        }
        
        endLbl.snp.makeConstraints { make in
            make.top.equalTo(33)
            make.left.equalTo(endBtn.snp.left)
        }
        
        startBtn.snp.makeConstraints { make in
            make.top.equalTo(startLbl.snp.bottom).offset(5)
            make.left.equalTo(21)
            make.height.equalTo(48)
            make.width.equalTo(160)
        }
        
        endBtn.snp.makeConstraints { make in
            make.top.equalTo(endLbl.snp.bottom).offset(5)
            make.right.equalTo(-21)
            make.height.equalTo(48)
            make.width.equalTo(160)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(startBtn.snp.bottom).offset(20)
            make.left.equalTo(21)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(5)
            make.left.equalTo(21)
            make.right.equalTo(-21)
            make.height.equalTo(48)
        }
        
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(50)
            make.left.equalTo(21)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLbl.snp.bottom).offset(5)
            make.left.equalTo(21)
            make.right.equalTo(-21)
            make.height.equalTo(backView.snp.height).multipliedBy(0.3)
        }
        
        createBtn.snp.makeConstraints { make in
            make.left.equalTo(21)
            make.right.equalTo(-21)
            make.bottom.equalTo(-15)
            make.height.equalTo(48)
        }
        
    }

}

extension CalendarViewController: CustomAlertDelegate{
    func okButtonTapped() {
        self.calendarView.removeFromSuperview()
    }
    
    func endButtonTapped() {
        self.calendarView.removeFromSuperview()
    }
    
}

protocol CustomAlertDelegate: AnyObject {
    func okButtonTapped()
    func endButtonTapped()
    //
}

class CustomAlert: UIView {
    
    weak var delegate: CustomAlertDelegate?
    
        let okBtn = UIButton()
        let dPicker = UIDatePicker()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .white
            clipsToBounds = true
            layer.cornerRadius = 10
            
            okBtn.setTitle("Done", for: .normal)
            okBtn.setTitleColor(.white, for: .normal)
            okBtn.backgroundColor = UIColor(named: "baseBlueColor")
            okBtn.addTarget(self, action: #selector(okBtnTapped), for: .touchUpInside)
            addSubview(okBtn)
            
            dPicker.datePickerMode = .dateAndTime
            dPicker.preferredDatePickerStyle = .inline
            dPicker.backgroundColor = UIColor(named: "datePickerColor")
            addSubview(dPicker)
            
            okBtn.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(40)
            }
            
            dPicker.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.bottom.equalTo(okBtn.snp.top)
            }
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc func okBtnTapped(){
            delegate?.okButtonTapped()
        }
}
