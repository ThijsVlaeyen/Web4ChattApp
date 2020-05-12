package db;

import domain.Message;
import java.util.List;

public interface IMessageRepository {

    void addMessage(Message message);

    List<Message> messagesFromChat(String userId);
}
