//
//  ChatVC.swift
//  wms
//
//  Created by Luofei on 2018/4/12.
//  Copyright © 2018年 lf. All rights reserved.
//

import UIKit

class ChatVC: BaseChatViewController {

    var messageSender: FakeMessageSender!
    var dataSource: FakeDataSource! {
        didSet {
            self.chatDataSource = self.dataSource
        }
    }
    
    lazy private var baseMessageHandler: BaseMessageHandler = {
        return BaseMessageHandler(messageSender: self.messageSender)
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let viewNavi = Bundle.main.loadNibNamed("ChattoNavi", owner: nil, options: nil)?.first as? ChattoNavi
        
        viewNavi?.frame = CGRect.init(x: 0, y: 0, width: IBScreenWidth, height: 64)
        
        viewNavi?.bton_reSet.addTarget(self, action: #selector(cancelAction(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(viewNavi!)
        
        self.view.sendSubview(toBack: viewNavi!)
        
//        let image = UIImage(named: "bubble-incoming-tail-border", in: Bundle(for: ChatVC.self), compatibleWith: nil)?.bma_tintWithColor(.blue)
        super.chatItemsDecorator = ChatItemsDemoDecorator()
//        let addIncomingMessageButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(ChatVC.addRandomIncomingMessage))
//        self.navigationItem.rightBarButtonItem = addIncomingMessageButton
    }
    
    func cancelAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func addRandomIncomingMessage() {
        self.dataSource.addRandomIncomingMessage()
    }
    
    var chatInputPresenter: BasicChatInputBarPresenter!
    override func createChatInputView() -> UIView {
        let chatInputView = ChatInputBar.loadNib()
        var appearance = ChatInputBarAppearance()
        appearance.sendButtonAppearance.title = NSLocalizedString("发送", comment: "")
        appearance.textInputAppearance.placeholderText = NSLocalizedString("", comment: "")
        self.chatInputPresenter = BasicChatInputBarPresenter(chatInputBar: chatInputView, chatInputItems: self.createChatInputItems(), chatInputBarAppearance: appearance)
        chatInputView.maxCharactersCount = 1000
        return chatInputView
    }
    
    override func createPresenterBuilders() -> [ChatItemType: [ChatItemPresenterBuilderProtocol]] {
        
        let textMessagePresenter = TextMessagePresenterBuilder(
            viewModelBuilder: DemoTextMessageViewModelBuilder(),
            interactionHandler: DemoTextMessageHandler(baseHandler: self.baseMessageHandler)
        )
        textMessagePresenter.baseMessageStyle = BaseMessageCollectionViewCellAvatarStyle()
        
        let photoMessagePresenter = PhotoMessagePresenterBuilder(
            viewModelBuilder: DemoPhotoMessageViewModelBuilder(),
            interactionHandler: DemoPhotoMessageHandler(baseHandler: self.baseMessageHandler)
        )
        photoMessagePresenter.baseCellStyle = BaseMessageCollectionViewCellAvatarStyle()
        
        return [
            DemoTextMessageModel.chatItemType: [
                textMessagePresenter
            ],
            DemoPhotoMessageModel.chatItemType: [
                photoMessagePresenter
            ],
            SendingStatusModel.chatItemType: [SendingStatusPresenterBuilder()],
            TimeSeparatorModel.chatItemType: [TimeSeparatorPresenterBuilder()]
        ]
    }
    
    func createChatInputItems() -> [ChatInputItemProtocol] {
        var items = [ChatInputItemProtocol]()
        items.append(self.createTextInputItem())
        items.append(self.createPhotoInputItem())
        return items
    }
    
    private func createTextInputItem() -> TextChatInputItem {
        let item = TextChatInputItem()
        item.textInputHandler = { [weak self] text in
            self?.dataSource.addTextMessage(text)
        }
        return item
    }
    
    private func createPhotoInputItem() -> PhotosChatInputItem {
        let item = PhotosChatInputItem(presentingController: self)
        item.photoInputHandler = { [weak self] image in
            self?.dataSource.addPhotoMessage(image)
        }
        return item
    }

}
