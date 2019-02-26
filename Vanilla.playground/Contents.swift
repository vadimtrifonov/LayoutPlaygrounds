import UIKit
import PlaygroundSupport

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
view.backgroundColor = .red

let subview = UIView()
subview.backgroundColor = .black

func a(view: UIView, subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        subview.topAnchor.constraint(equalTo: view.topAnchor),
        subview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        subview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
}

func b(view: UIView, subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        subview.topAnchor.constraint(equalTo: view.topAnchor),
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        subview.widthAnchor.constraint(equalToConstant: 100),
        subview.heightAnchor.constraint(equalToConstant: 100)
    ])
}

func c(view: UIView, subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        subview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        subview.widthAnchor.constraint(equalToConstant: 100),
        subview.heightAnchor.constraint(equalToConstant: 100)
    ])
}

func d(view: UIView, subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        subview.topAnchor.constraint(equalTo: view.topAnchor),
        subview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        subview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        subview.heightAnchor.constraint(equalToConstant: 100)
    ])
}

func e(view: UIView, subview: UIView) {
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









