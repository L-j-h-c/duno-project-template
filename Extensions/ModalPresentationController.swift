//
//  ModalPresentationController.swift
//  Journey
//
//  Created by 윤예지 on 2021/07/07.
//

import UIKit

class ModalPresentationController: UIPresentationController {
    let backgroundView: UIView!
    var tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer()
    var check: Bool = false
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        backgroundView = UIView()
        backgroundView.backgroundColor = .darkGray
        super.init(presentedViewController: presentedViewController, presenting: presentedViewController)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.backgroundView.isUserInteractionEnabled = true
        self.backgroundView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // 보여주려는 뷰의 크기 설정
    override var frameOfPresentedViewInContainerView: CGRect {
        CGRect(origin: CGPoint(x: 0,
                               y: self.containerView!.frame.height*0.08),
               size: CGSize(width: self.containerView!.frame.width,
                            height: self.containerView!.frame.height * 0.92))
    }
    
    // 모달이 올라갈 때 뒤에 있는 배경을 검은색 처리해주는 용도
    override func presentationTransitionWillBegin() {
        self.backgroundView.alpha = 0
        self.containerView!.addSubview(backgroundView)
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in self.backgroundView.alpha = 0.7},
                                                                    completion: nil)
    }
    
    // 모달이 없어질 때 검은색 배경을 슈퍼뷰에서 제거
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in self.backgroundView.alpha = 0},
                                                                    completion: { _ in self.backgroundView.removeFromSuperview()})
    }
    
    // 모달의 크기가 조절됐을 때 호출되는 함수
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        if check {
            presentedView?.frame = frameOfPresentedViewInContainerView
            check.toggle()
        } else {
            presentedView?.frame = CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height * 0.55), size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height * 0.45))
            check.toggle()
        }
        backgroundView.frame = containerView!.bounds
    }

    @objc func dismissController() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}
