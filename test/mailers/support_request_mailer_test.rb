require "test_helper"

class SupportRequestMailerTest < ActionMailer::TestCase
  test "respond" do
    support_request = SupportRequest.create!(
      email: "cliente@exemplo.com",
      subject: "Ajuda",
      body: "Preciso de suporte"
    )

    mail = SupportRequestMailer.respond(support_request)
    assert_equal "Re: Ajuda", mail.subject
    assert_equal [ "cliente@exemplo.com" ], mail.to
    assert_match "Preciso de suporte", mail.body.encoded
  end
end
