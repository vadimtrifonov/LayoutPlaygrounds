import UIKit
import PlaygroundSupport
import TinyConstraints

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
view.backgroundColor = .red

let subview = UIView()
subview.backgroundColor = .black

func a(view: UIView, subview: UIView) {
    subview.edges(to: view)
}

func b(view: UIView, subview: UIView) {
    subview.top(to: view)
    subview.trailing(to: view)
    subview.size(CGSize(width: 100, height: 100))
}

func c(view: UIView, subview: UIView) {
    subview.center(in: view)
    subview.size(CGSize(width: 100, height: 100))
}

func d(view: UIView, subview: UIView) {
    subview.edges(to: view, excluding: .bottom)
    subview.height(100)
}

func e(view: UIView, subview: UIView) {
    subview.edges(to: view.readableContentGuide)
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









