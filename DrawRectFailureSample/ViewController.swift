import UIKit

// `drawRect` fails when `height` is increased
private let height: CGFloat = 2000

class ViewController: UIViewController {
    @IBOutlet private var scrollView: UIScrollView!
    
    private var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawRectView: DrawRectView = DrawRectView()
        drawRectView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(drawRectView)
        
        heightConstraint = drawRectView.heightAnchor.constraint(equalToConstant: height)
        NSLayoutConstraint.activate([
            drawRectView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            drawRectView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            drawRectView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            drawRectView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            drawRectView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            heightConstraint,
        ])
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        // this does not make `drawRect` fail
        heightConstraint.constant += 1000
    }
}

class DrawRectView: UIView {
    override func draw(_ rect: CGRect) {
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        print("\(#file) \(#line): frame=\(frame)")
        
        context.setLineWidth(6.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: .zero)
        context.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        context.strokePath()
    }
}
