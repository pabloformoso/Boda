class AccessRequestMailer < ActionMailer::Base
  
  default from: "boda@pabloformoso.com"
  
  def request_received(access_request)
    @name = access_request.name
    @email = access_request.email
    
    mail to: access_request.email, subject: "[Deborah y Pablo] Solicitud recibida"
  end
  
  def accept_request(access_request)
    @name = access_request.name
    @email = access_request.email
    
    mail to: access_request.email, subject: "[Deborah y Pablo] Solicitud aceptada"
  end
  
end
