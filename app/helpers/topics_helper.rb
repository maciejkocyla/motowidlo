module TopicsHelper

  def last_topics(count)
    topics = Topic.all
    lastTopics = Array.new
    if topics.count >= count
      for t in topics[-5..-1] do 
        lastTopics.push(t)
      end
    elsif topics.count < cound && topics.any? 
      for t in topics.all do 
        lastTopics.push(t)
      end
    else return 0
    end

    return lastTopics

  end
end
