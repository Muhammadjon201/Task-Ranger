//
//  OnboardingViewController.swift
//  Task-Ranger
//
//  Created by ericzero on 1/21/23.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var startBtn: UIButton = {
        let startBtn = UIButton(type: .system)
        startBtn.setTitle("Get Started", for: .normal)
        startBtn.tintColor = .white
        startBtn.backgroundColor = UIColor(named: "baseBlueColor")
        startBtn.layer.cornerRadius = 10
        startBtn.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
        return startBtn
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = UIColor(named: "baseBlueColor")
        pageControl.isEnabled = true
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    lazy var skipBtn: UIButton = {
        let skipBtn = UIButton(type: .system)
        skipBtn.setTitle("Skip", for: .normal)
        skipBtn.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        return skipBtn
    }()
    
    lazy var horizontalStack: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalSpacing
        horizontalStack.alignment = .center
        return horizontalStack
    }()
    
    // skipButton
    
    @objc func skipTapped(){
        let vc = TabbarController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // startButton
    
    @objc func startBtnTapped(){
        if currentPage == dataFlow.count - 1 {
            let vc = TabbarController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
 
    // Data flow
    
    var dataFlow: [Onboarding] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == dataFlow.count - 1 {
                startBtn.setTitle("Get Started", for: .normal)
            }else{
                startBtn.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        collectionData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        
    }
    
    func collectionData(){
        dataFlow = [Onboarding(title: "Easy Time Management", description: "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first ", image: UIImage(named: "onboardImd1")!),
                  Onboarding(title: "Increase Work Effectiveness", description: "Time management and the determination of more important tasks will give your job statistics better and always improve", image: UIImage(named: "onboardImd2")!),
                  Onboarding(title: "Reminder Notification", description: "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set", image: UIImage(named: "onboardImd3")!)
        ]
    }
    
    func setUp() {
        
        view.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(pageControl)
        horizontalStack.addArrangedSubview(skipBtn)
        view.addSubview(collectionView)
        view.addSubview(startBtn)
            
        horizontalStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(0)
            make.right.equalTo(-10)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(horizontalStack.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        startBtn.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-30)
            make.height.equalTo(50)
            make.width.equalTo(345)
        }
        
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFlow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.updateCell(data: dataFlow[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size //.init(width: view.frame.width, height: 850)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
