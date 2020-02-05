//
//  CustomAnimationsNavigationController.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/4/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

//Based on https://stackoverflow.com/questions/51319877/uinavigationcontroller-how-to-change-animation-for-single-uiviewcontroller
import UIKit

enum TransitionType {
    case fade
    case movein
    case push
    case reveal
}
enum TransitionSubtype {
    case right
    case left
    case top
    case bottom
}

extension UINavigationController {

    fileprivate func getTransition(by type: TransitionType) -> String? {
        var transition: String?
        switch type {
        case .fade:
            transition = CATransitionType.fade.rawValue
            break
        case .push:
            transition = CATransitionType.push.rawValue
            break
        case .movein:
            transition = CATransitionType.moveIn.rawValue
            break
        case .reveal:
            transition = CATransitionType.reveal.rawValue
            break
        default:
            transition = nil
            break
        }
        return transition
    }
    fileprivate func getSubTransition(by type: TransitionSubtype) -> String? {
        var transition: String?
        switch type {
        case .right:
            transition = CATransitionSubtype.fromRight.rawValue
            break
        case .left:
            transition = CATransitionSubtype.fromLeft.rawValue
            break
        case .top:
            transition = CATransitionSubtype.fromTop.rawValue
            break
        case .bottom:
            transition = CATransitionSubtype.fromBottom.rawValue
            break
        default:
            transition = nil
            break
        }
        return transition
    }

    func display(viewController: UIViewController, animated: Bool, animationType: TransitionType = .push, animationSubtype: TransitionSubtype = .right) -> Bool {
        guard  let type = getTransition(by: animationType) else {return false}
        guard  let subtype = getSubTransition(by: animationSubtype) else {return false}
        if animated {
            let transition = CATransition()
            transition.duration = 0.35
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType(rawValue: type)
            transition.subtype = CATransitionSubtype(rawValue: subtype)
            self.view.layer.add(transition, forKey: nil)
        }
        _ = self.pushViewController(viewController, animated: false)
        return true
    }
    func hide(animated: Bool, animationType: TransitionType = .push, animationSubtype: TransitionSubtype = .left) -> Bool {
        guard  let type = getTransition(by: animationType) else {return false}
        guard  let subtype = getSubTransition(by: animationSubtype) else {return false}
        if animated {
            let transition = CATransition()
            transition.duration = 0.35
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType(rawValue: type)
            transition.subtype = CATransitionSubtype(rawValue: subtype)
            self.view.layer.add(transition, forKey: nil)
        }
        _ = self.popViewController(animated: false)
        return true
    }

}
