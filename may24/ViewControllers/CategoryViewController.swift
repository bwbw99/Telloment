//
//  CategoryViewController.swift
//  may24
//
//  Created by 최병욱 on 5/28/24.
//

import UIKit

class CategoryViewController:UIViewController,SendDataDelegate{
    func recieveData(response: String,categoryCode: String) {
        self.CategoryLabel.text = response
        self.categoryCode = categoryCode
        self.CategoryImage.image = UIImage(named: response)
    }
    
    
    @IBOutlet weak var CategorySearchBar: UISearchBar!
    
    @IBOutlet weak var CategoryImage: UIImageView!
    @IBOutlet weak var CategoryLabel: UILabel!
    
    @IBOutlet weak var bookContentView01: UIView!
    @IBOutlet weak var bookContentView02: UIView!
    @IBOutlet weak var bookContentView03: UIView!
    @IBOutlet weak var bookContentView04: UIView!
    @IBOutlet weak var bookContentView05: UIView!
    @IBOutlet weak var bookContentView06: UIView!
    @IBOutlet weak var bookContentView07: UIView!
    @IBOutlet weak var bookContentView08: UIView!
    @IBOutlet weak var bookLikeCountLabel01: UILabel!
    @IBOutlet weak var bookLikeCountLabel02: UILabel!
    @IBOutlet weak var bookLikeCountLabel03: UILabel!
    @IBOutlet weak var bookLikeCountLabel04: UILabel!
    @IBOutlet weak var bookLikeCountLabel05: UILabel!
    @IBOutlet weak var bookLikeCountLabel06: UILabel!
    @IBOutlet weak var bookLikeCountLabel07: UILabel!
    @IBOutlet weak var bookLikeCountLabel08: UILabel!
    
    @IBOutlet weak var bookPageCountLabel01: UILabel!
    @IBOutlet weak var bookPageCountLabel02: UILabel!
    @IBOutlet weak var bookPageCountLabel03: UILabel!
    @IBOutlet weak var bookPageCountLabel04: UILabel!
    @IBOutlet weak var bookPageCountLabel05: UILabel!
    @IBOutlet weak var bookPageCountLabel06: UILabel!
    @IBOutlet weak var bookPageCountLabel07: UILabel!
    @IBOutlet weak var bookPageCountLabel08: UILabel!

    @IBOutlet weak var bookTitleLabel01: UILabel!
    @IBOutlet weak var bookTitleLabel02: UILabel!
    @IBOutlet weak var bookTitleLabel03: UILabel!
    @IBOutlet weak var bookTitleLabel04: UILabel!
    @IBOutlet weak var bookTitleLabel05: UILabel!
    @IBOutlet weak var bookTitleLabel06: UILabel!
    @IBOutlet weak var bookTitleLabel07: UILabel!
    @IBOutlet weak var bookTitleLabel08: UILabel!
    
    private var categoryCode :String =  "TRIP"
    
    @IBAction func ChangeButtonTapped(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "CategoryListVC") as? CategoryListViewController else { return }
                
        vc.dataDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookContentView01.isHidden = true
        bookContentView02.isHidden = true
        bookContentView03.isHidden = true
        bookContentView04.isHidden = true
        bookContentView05.isHidden = true
        bookContentView06.isHidden = true
        bookContentView07.isHidden = true
        bookContentView08.isHidden = true

        self.CategoryImage.layer.cornerRadius = 55
        
        self.CategorySearchBar.searchBarStyle = .minimal
        self.CategorySearchBar.searchTextField.text = "현재 카테고리에서 제목, 내용, 태그로 검색"
        self.CategorySearchBar.searchTextField.font = UIFont(name: "BMJUAOTF", size: 15)
        self.CategorySearchBar.searchTextField.textColor = UIColor.darkGray
        hideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadBooks()
    }
    
    private func loadBooks() {
        BookApi.shared.getAllBooksByCategory(category: categoryCode, page: 0, size: 8) { res in
            switch res {
            case .success(let data):
                for (i, book) in data.content.enumerated() {
                    self.drawBook(index: i, book: book)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func drawBook(index: Int, book: BookDto) {
        if index == 0 {
            bookContentView01.isHidden = false
            bookTitleLabel01.text = book.bookName
            bookLikeCountLabel01.text = "\(book.totalLikeCount)"
            bookPageCountLabel01.text = "\(book.totalPageCount)"
        }
        else if index == 1 {
            bookContentView02.isHidden = false
            bookTitleLabel02.text = book.bookName
            bookLikeCountLabel02.text = "\(book.totalLikeCount)"
            bookPageCountLabel02.text = "\(book.totalPageCount)"
        }
        else if index == 2 {
            bookContentView03.isHidden = false
            bookTitleLabel03.text = book.bookName
            bookLikeCountLabel03.text = "\(book.totalLikeCount)"
            bookPageCountLabel03.text = "\(book.totalPageCount)"
        }
        else if index == 3 {
            bookContentView04.isHidden = false
            bookTitleLabel04.text = book.bookName
            bookLikeCountLabel04.text = "\(book.totalLikeCount)"
            bookPageCountLabel04.text = "\(book.totalPageCount)"
        }
        else if index == 4 {
            bookContentView05.isHidden = false
            bookTitleLabel05.text = book.bookName
            bookLikeCountLabel05.text = "\(book.totalLikeCount)"
            bookPageCountLabel05.text = "\(book.totalPageCount)"
        }
        else if index == 5 {
            bookContentView06.isHidden = false
            bookTitleLabel06.text = book.bookName
            bookLikeCountLabel06.text = "\(book.totalLikeCount)"
            bookPageCountLabel06.text = "\(book.totalPageCount)"
        }
        else if index == 6 {
            bookContentView07.isHidden = false
            bookTitleLabel07.text = book.bookName
            bookLikeCountLabel07.text = "\(book.totalLikeCount)"
            bookPageCountLabel07.text = "\(book.totalPageCount)"
        }
        else if index == 7 {
            bookContentView08.isHidden = false
            bookTitleLabel08.text = book.bookName
            bookLikeCountLabel08.text = "\(book.totalLikeCount)"
            bookPageCountLabel08.text = "\(book.totalPageCount)"
        }
    }
}
