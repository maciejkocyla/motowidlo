module TopicsHelper

  def last_topics(count)
    topics = Topic.all
    lastTopics = Array.new
    if topics.count >= count
      for t in topics.last(count) do 
        lastTopics.push(t)
      end
    elsif topics.count < count && topics.any? 
      for t in topics.all do 
        lastTopics.push(t)
      end
    else return 0
    end

    return lastTopics
  end

  def active_topics(count = 5)
    topics = Topic.all.sort! { |x, y| y.date_of_last_activity <=> x.date_of_last_activity }
    return topics[0..count]
  end
end
