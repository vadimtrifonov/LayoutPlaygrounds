import UIKit
import PlaygroundSupport
import SnapKit

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
view.backgroundColor = .red

let subview = UIView()
subview.backgroundColor = .black

func a(view: UIView, subview: UIView) {
    subview.snp.makeConstraints { make in
        make.edges.equalTo(view)
    }
}

func b(view: UIView, subview: UIView) {
    subview.snp.makeConstraints { make in
        make.top.equalTo(view)
        make.trailing.equalTo(view)
        make.width.equalTo(100)
        make.height.equalTo(100)
    }
}

func c(view: UIView, subview: UIView) {
    subview.snp.makeConstraints { make in
        make.width.equalTo(100)
        make.height.equalTo(100)
    }
}

func d(view: UIView, subview: UIView) {
    subview.snp.makeConstraints { make in
        make.top.equalTo(view)
        make.leading.equalTo(view)
        make.trailing.equalTo(view)
        make.height.equalTo(100)
    }
}

func e(view: UIView, subview: UIView) {
    subview.snp.makeConstraints { make in
        make.edges.equalTo(view.readableContentGuide)
    }
}

let transformations = [a, b, c, d, e]

transformations.enumerated().forEach { index, transformation in
    UIViewPropertyAnimator.runningPropertyAnimator(
        withDuration: 0.5,
        delay: Double(index + 2),
        options: [.curveEaseOut],
        animations: {
            subview.snp.removeConstraints() // Otherwise constraints are not removed
            subview.removeFromSuperview()
            view.addSubview(subview)
            transformation(view, subview)
            view.layoutIfNeeded()
        }
    )
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = view









