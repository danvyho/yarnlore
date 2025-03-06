module ApplicationHelper
  def notification_message(notification)
    case notification.notification_type.to_sym
    when :comment_on_followed_post
      "#{notification.notifiable.user.username} commented on a post you follow."
    when :like_on_post
      "#{notification.notifiable.user.username} liked your post."
    when :new_post_from_followed_user
      "#{notification.notifiable.user.username} published a new post."
    when :reply_to_comment
      "#{notification.notifiable.user.username} replied to your comment."
    else
      "You have a new notification."
    end
  end
end
