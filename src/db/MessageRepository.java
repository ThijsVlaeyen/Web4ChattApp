package db;

import domain.Message;

import java.util.ArrayList;
import java.util.List;

public class MessageRepository implements IMessageRepository {
    private List<Message> messageList = new ArrayList<>();

    public MessageRepository() {
        messageList = new ArrayList<>();
    }

    @Override
    public void addMessage(Message message){
        this.messageList.add(message);
    }

    @Override
    public List<Message> messagesFromChat(String userId) {
        List<Message> result = new ArrayList();
        for(Message message:getAllMessages()){
            if(message.getRecipientId().equalsIgnoreCase(userId) || message.getSenderId().equalsIgnoreCase(userId)){
                result.add(message);
            }
        }
        return result;
    }

    private List<Message> getAllMessages(){
        return this.messageList;
    }
}