
import UIKit
import SnapKit

class EditMemoViewController: UIViewController {
    var memo: MemoInformation?
    var index: Int?
    weak var delegate: EditMemoDelegate?
    
    let TitleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    let ContentTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureSubviews()
        makeConstraints()
        
        navigationItem.title = "메모 수정"
        setNavigationBar()
        
        if let memo = memo {
            displayMemoInformation(memo)
        }
        
    }
    
    func configureSubviews() {
        view.addSubview(TitleTextField)
        view.addSubview(ContentTextField)
        
    }
    
    func makeConstraints() {
        TitleTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)}
        ContentTextField.snp.makeConstraints { make in
            make.top.equalTo(TitleTextField.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)}
    }
    
    //네이게이션 바 "완료" 버튼 생성
    func setNavigationBar() {
        let completeButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonTapped))
                navigationItem.rightBarButtonItem = completeButton
    }
    
    //"완료" 버튼 눌렀을때 수행하는 동작
    @objc func completeButtonTapped() {
        guard let updatedMemo = createUpdatedMemo() else {
                return
            }

        delegate?.didUpdateMemo(updatedMemo, atIndex: index!)
        self.navigationController?.popViewController(animated: true)
    }
    
    //DetailMemoViewController로부터 받아온 데이터에 따라 TextField 수정
    func displayMemoInformation(_ memo: MemoInformation) {
        TitleTextField.text = memo.title
        ContentTextField.text = memo.content
    }
    
    //TextField에서 수정된 내용을 가져와서 MemoInformation을 업데이트
    func createUpdatedMemo() -> MemoInformation? {
        guard let updatedTitle = TitleTextField.text,
                let updatedContent = ContentTextField.text else {
                return nil
            }
            
        return MemoInformation(id: memo?.id, title: updatedTitle, content: updatedContent)
        }
}
