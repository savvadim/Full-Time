import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backColor
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "splash")
        self.view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
