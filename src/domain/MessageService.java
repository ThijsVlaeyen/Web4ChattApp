package domain;

import com.google.gson.JsonObject;
import db.IMessageRepository;
import db.MessageRepository;

import java.util.List;

public class MessageService {

    private IMessageRepository IMessageRepository = new MessageRepository();

    public MessageService() {
    }

    public void addMessage(Person sender, Person recipient, String message){ ;
        Message message1 = new Message(message,recipient,sender);
        this.IMessageRepository.addMessage(message1);
    }

    private List<Message> getMessagesForUser(String userId){
        return this.IMessageRepository.messagesFromChat(userId);
    }

    public JsonObject getMessages(Person user){
        JsonObject messages = getMessagesAsJson(getMessagesForUser(user.getUserId()),user);
        return messages;
    }

    private JsonObject getMessagesAsJson(List<Message> messages, Person user){
        JsonObject object = new JsonObject();
        int teller = 0;
        for(Message message: messages){

            JsonObject messageObject = new JsonObject();
            messageObject.addProperty("message", message.getMessage());
            messageObject.addProperty("recipientId", message.getRecipientId());
            messageObject.addProperty("sender", message.getSender().getFirstName());
            messageObject.addProperty("senderId",message.getSenderId());
            object.add(String.valueOf(teller),messageObject);
            teller+=1;
        }
        teller=0;
        return object;
    }
}
