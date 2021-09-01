//
//  TextViewCell.swift
//  TextViewDemo
//
//  Created by Eden on 2021/9/1.
//

import UIKit

public class TextViewCell: UITableViewCell
{
    // MARK: - Properties -
    
    public weak var delegate: TextViewCellDelegate?
    
    @IBOutlet fileprivate weak var textView: UITextView!
    
    // MARK: - Methods -
    // MARK: Initial Method
    
    public override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
        self.textView.delegate = self
    }
    
    deinit
    {
        
    }
}

extension TextViewCell: UITextViewDelegate
{
    public func textViewDidChange(_ textView: UITextView)
    {
        self.delegate?.cellTextDidChange(self)
    }
}

// MARK: - Confirm Protocol -

extension TextViewCell: CustomCellRegistrable
{
    public static var cellNib: UINib? {
        
        let nib = UINib(nibName: "TextViewCell", bundle: nil)
        
        return nib
    }
    
    public static var cellIdentifier: String {
        
        return "TextViewCell"
    }
}

public protocol TextViewCellDelegate: AnyObject
{
    func cellTextDidChange(_ cell: TextViewCell)
}
