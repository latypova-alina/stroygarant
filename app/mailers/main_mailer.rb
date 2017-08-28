class MainMailer < ActionMailer::Base
  
  default from: "info@stroygarant.moscow"

  def call_request(call_request)
    @call_request = call_request
    
    mail(
        to: ActiveadminSettings::Setting.value('Получатель', I18n.locale), 
        subject: "Заказ звонка на stroygarant.moscow"
    )
  end

end
