//
//  WWArticleCell.swift
//  wenwen
//
//  Created by Wei Zhang on 2017/11/27.
//  Copyright © 2017年 wenwenkeji. All rights reserved.
//

import UIKit
import YYText
import YYImage

class WWArticleCell: UITableViewCell {
    
    @IBOutlet weak var richTextLabel: YYLabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        richTextLabel.numberOfLines = 0
        richTextLabel.preferredMaxLayoutWidth = WWSpecs.windowWidth()
        richTextLabel.textAlignment = .justified
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 8
        
        
        let str = " 肿瘤是机体在各种致瘤因素作用下，局部组织的细胞在基因水平上失去对其生长的正常调控导致异常增生与分化而形成的新生物。新生物一旦形成，不因病因消除而停止生长，他的生长不受正常机体生理调节，而是破坏正常组织与器官，这一点在恶性肿瘤尤其明显。与良性肿瘤相比，恶性肿瘤生长速度快，呈浸润性生长，易发生出血、坏死、溃疡等，并常有远处转移，造成人体消瘦、无力、贫血、食欲不振、发热以及严重的脏器功能受损等，最终造成患者死亡。\n"
        
        var attributeText: NSMutableAttributedString = NSMutableAttributedString(string: str, attributes: [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.foregroundColor: wwTheme.fontColor4,
            NSAttributedStringKey.paragraphStyle: style,
            NSAttributedStringKey.underlineStyle: NSNumber(value: Int8(NSUnderlineStyle.styleNone.rawValue))
            ])
        
        let imageView = YYAnimatedImageView(image: UIImage(named: "articleSamplePic"))
        let font = UIFont.systemFont(ofSize: 80)
        let width = WWSpecs.windowWidth() - 40
        imageView.frame = CGRect.init(x: 0, y: 0, width: width, height: 150)
        imageView.contentMode = .scaleAspectFit
        let att1 = NSAttributedString.yy_attachmentString(withContent: imageView, contentMode: .scaleAspectFit, attachmentSize: imageView.frame.size, alignTo: font, alignment: .bottom)
        attributeText.append(att1)
        
        richTextLabel.attributedText = attributeText
        
    }

    
    
}
