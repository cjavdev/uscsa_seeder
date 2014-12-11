require 'digest/md5'

module ApplicationHelper
  def gravatar_url(email)
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{ hash }?s=40&d=identicon"
  end
end
