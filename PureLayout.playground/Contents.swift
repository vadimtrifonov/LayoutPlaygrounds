import UIKit
import PlaygroundSupport
import PureLayout

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
view.backgroundColor = .red

let subview = UIView()
subview.backgroundColor = .black

func a(view: UIView, subview: UIView) {
    // No way to say to which view
    subview.autoPinEdgesToSuperviewEdges()
}

func b(view: UIView, subview: UIView) {
    subview.autoPinEdge(.top, to: .top, of: view)
    subview.autoPinEdge(.trailing, to: .trailing, of: view)
    subview.autoSetDimensions(to: CGSize(width: 100, height: 100))
}

func c(view: UIView, subview: UIView) {
    subview.autoCenterInSuperview() // No way to say which view
    subview.autoSetDimensions(to: CGSize(width: 100, height: 100))
}

func d(view: UIView, subview: UIView) {
    subview.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
    subview.autoSetDimension(.height, toSize: 100)
}

func e(view: UIView, subview: UIView) {
    // No way to set to readable content guide
    subview.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        subview.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
        subview.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
        subview.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
        subview.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor)
    ])
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









