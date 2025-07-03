class ApplicationMailbox < ActionMailbox::Base
  routing "support@example.com" => :support
  # routing /something/i => :somewhere
end
