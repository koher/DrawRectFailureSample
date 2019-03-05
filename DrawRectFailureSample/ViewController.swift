import UIKit

private let height: CGFloat = 2000

class ViewController: UIViewController {
    @IBOutlet private var scrollView: UIScrollView!
    
    private var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sampleView: SampleView = SampleView()
        sampleView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(sampleView)
        
        heightConstraint = sampleView.heightAnchor.constraint(equalToConstant: height)
        NSLayoutConstraint.activate([
            sampleView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            sampleView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            sampleView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            sampleView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            sampleView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            heightConstraint,
        ])
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        heightConstraint.constant += 1000
    }
}

class SampleView: UIView {
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
