//
//  UINavigationController+Extension.swift
//  Journey
//
//  Created by 초이 on 2021/06/29.
//

import UIKit

extension UINavigationController {
    var previousViewController: UIViewController? {
       viewControllers.count > 1 ? viewControllers[viewControllers.count - 2] : nil
    }
}

// MARK: - NEW

extension UINavigationController {
    
    // MARK: - 투명
    
    func initTransparentNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.setTitleTextAttributes(appearance)
    }
    
    // MARK: - 뒤로가기 버튼
    
    func initWithBackButton(backgroundColor: UIColor? = nil) {
        let appearance = UINavigationBarAppearance()
        appearance.initBackButtonAppearance()
        
        if backgroundColor != nil {
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = backgroundColor
            appearance.shadowColor = .clear
            self.navigationBar.barTintColor = backgroundColor // for iOS14
        } else {
            appearance.configureWithTransparentBackground()
        }
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.tintColor = .black
        self.setTitleTextAttributes(appearance)
    }
    
    // MARK: - 뒤로가기 버튼 + 완료 버튼
    
    func initWithBackAndDoneButton(navigationItem: UINavigationItem?, doneButtonClosure: Selector, backgroundColor: UIColor? = nil) {
        initWithBackButton(backgroundColor: backgroundColor)
        
        // done Button
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: self.topViewController, action: doneButtonClosure)
        navigationItem?.rightBarButtonItem = doneButton
    }
    
    // MARK: - 뒤로가기 버튼 + 커스텀 버튼 1개
    
    func initWithOneCustomButton(navigationItem: UINavigationItem?, firstButtonImage: UIImage, firstButtonClosure: Selector, backgroundColor: UIColor? = nil) {
        initWithBackButton(backgroundColor: backgroundColor)
        
        let firstButton = UIBarButtonItem(image: firstButtonImage, style: .plain, target: self.topViewController, action: firstButtonClosure)
        navigationItem?.rightBarButtonItem = firstButton
        
    }
    
    // MARK: - 커스텀 버튼 3개 - 메인에서만 사용
    
    func initWithThreeCustomButtons(navigationItem: UINavigationItem?, firstButton: UIBarButtonItem, secondButton: UIBarButtonItem, thirdButton: UIBarButtonItem) {
        initTransparentNavBar()
        
        let spacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacing.width = 16
        navigationItem?.rightBarButtonItems = [thirdButton, spacing, secondButton, spacing, firstButton]
    }
    
    // MARK: - 뒤로가기 버튼 + 닫기 버튼 - 글쓰기 뷰에서만 사용
    
    func initWithBackAndCloseButton(navigationItem: UINavigationItem?, closeButtonClosure: Selector) {
        initWithBackButton(backgroundColor: .white)

        let closeButton = UIBarButtonItem(image: Const.Image.gnbIconX, style: .plain, target: self.topViewController, action: closeButtonClosure)
        navigationItem?.rightBarButtonItem = closeButton
    }
    
    // MARK: - title 추가
    
    func setTitleTextAttributes(_ appearance: UINavigationBarAppearance) {
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.spoqaHanSansNeo(weight: .regular, size: 15), NSAttributedString.Key.foregroundColor: UIColor.Black]
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance

    }
    // MARK: - @objc function
    
    @objc func touchBackButton() {
        popViewController(animated: true)
    }
}

extension UINavigationBarAppearance {
    
    func initBackButtonAppearance() {
        // back button image
        var backButtonImage: UIImage? {
            return Const.Image.gnbIcnBack
        }
        // back button appearance
        var backButtonAppearance: UIBarButtonItemAppearance {
            let backButtonAppearance = UIBarButtonItemAppearance()
            // backButton하단에 표출되는 text를 안보이게 설정
            backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont.systemFont(ofSize: 0.0)]

            return backButtonAppearance
        }
        self.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        self.backButtonAppearance = backButtonAppearance
    }
}
