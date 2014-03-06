module MessagesHelper

  def user_msgs
    msgs = Array.new
    Message.all.each do |m|
      if m.author == current_user || m.recipient == current_user
        msgs.push(m)
      end
    end
    return msgs
  end

  def user_contacts
    contacts = Array.new
    user_msgs.each do |m|
      if m.author != current_user
        contacts.push(m.author) unless contacts.include?(m.author)
      else
        contacts.push(m.recipient) unless contacts.include?(m.recipient)
      end
    end
    return contacts
  end
end
