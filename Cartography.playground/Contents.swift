import UIKit
import PlaygroundSupport
import Cartography

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
view.backgroundColor = .red

let subview = UIView()
subview.backgroundColor = .black

func a(view: UIView, subview: UIView) {
    constrain(subview, view) { subview, view in
        subview.edges == view.edges
    }
}

func b(view: UIView, subview: UIView) {
    constrain(subview, view) { subview, view in
        subview.top == view.top
        subview.trailing == view.trailing
        subview.width == 100
        subview.height == 100
    }
}

func c(view: UIView, subview: UIView) {
    constrain(subview, view) { subview, view in
        subview.center == view.center
        subview.width == 100
        subview.height == 100
    }
}

func d(view: UIView, subview: UIView) {
    constrain(subview, view) { subview, view in
        subview.top == view.top
        subview.leading == view.leading
        subview.trailing == view.trailing
        subview.width == 100
        subview.height == 100
    }
}

func e(view: UIView, subview: UIView) {
    constrain(subview, view) { subview, view in
        subview.edges == view.readableContentGuide.edges
    }
}

let transformations = [a, b, c, d, e]

transformations.enumerated().forEach { index, transformation in
    UIViewPropertyAnimator.runningPropertyAnimator(
        withDuration: 0.5,
        delay: Double(index + 2),
        options: [.curveEaseOut],
        animations: {
            subview.removeFromSuperview()
            view.addSubview(subview)
            transformation(view, subview)
            view.layoutIfNeeded()
        }
    )
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = view









