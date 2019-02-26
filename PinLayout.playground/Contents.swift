import UIKit
import PlaygroundSupport
import PinLayout

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
view.backgroundColor = .red

let subview = UIView()
subview.backgroundColor = .black

func a(view: UIView, subview: UIView) {
    // No way to say to which view
    subview.pin.all()
}

func b(view: UIView, subview: UIView) {
    // Doesn't work - not constraining to top right
    // No way to constraint to trailing edge
    subview.pin.topRight(to: view.anchor.topRight)
    subview.pin.size(CGSize(width: 100, height: 100))
}

func c(view: UIView, subview: UIView) {
    subview.pin.center(to: view.anchor.center)
    subview.pin.size(CGSize(width: 100, height: 100))
}

func d(view: UIView, subview: UIView) {
    subview.pin.top().horizontally()
    subview.pin.height(100)
}

func e(view: UIView, subview: UIView) {
    // Doesn't work - not constraining to readable guide
    subview.pin.all(view.pin.readableMargins)
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









