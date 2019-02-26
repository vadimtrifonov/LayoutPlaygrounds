import UIKit
import PlaygroundSupport
import Constraints

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
view.backgroundColor = .red

let subview = UIView()
subview.backgroundColor = .black

func a(view: UIView, subview: UIView) {
    subview.constrain.edges(.all, to: view)
}

func b(view: UIView, subview: UIView) {
    subview.constrain.edges([.top, .trailing], to: view)
    subview.constrain.size(CGSize(width: 100, height: 100))
}

func c(view: UIView, subview: UIView) {
    subview.constrain.center(to: view)
    subview.constrain.size(CGSize(width: 100, height: 100))
}

func d(view: UIView, subview: UIView) {
    subview.constrain.edges(.all(except: .bottom), to: view)
    subview.constrain.dimension(.height, constant: 100)
}

func e(view: UIView, subview: UIView) {
    subview.constrain.edges(.all, to: view.readableContentGuide)
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
