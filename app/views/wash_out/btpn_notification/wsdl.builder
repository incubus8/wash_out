xml.instruct!
xml.tag! "wsdl:definitions",
  'name' => 'BtpnNotificationService',
  'targetNamespace' => 'http://pegasus/integration/BtpnNotificationService/',
  'xmlns:xth' => 'http://pegasus/integration/BtpnNotificationService/',
  'xmlns:soap' => 'http://schemas.xmlsoap.org/wsdl/soap/',
  'xmlns:wsdl' => 'http://schemas.xmlsoap.org/wsdl/',
  'xmlns:xsd' => 'http://www.w3.org/2001/XMLSchema',
  'xmlns:btpnnotification' => 'http://pegasus/integration/btpnnotification' do

  xml.tag! "wsdl:types" do
    xml.tag! "xsd:schema" do
      xml.tag! "xsd:import", :namespace => "http://pegasus/integration/btpnnotification", :schemaLocation => "pegasus.integration.btpnnotification.xsd"
  end

  xml.tag! "wsdl:message", :name => "SmsNotificationGeneralOperationRequest" do
    xml.tag! "wsdl:part", :name => "smsNotificationGeneralRequest", :element => "btpnnotification:SmsNotificationGeneral"
  end
  xml.tag! "wsdl:message", :name => "SmsNotificationGeneralOperationReply" do
    xml.tag! "wsdl:part", :name => "smsNotificationGeneralReply", :element => "btpnnotification:SmsNotificationGeneralResponse"
  end

  xml.tag! "wsdl:portType", :name => "btpnNotificationServicesPortType" do
    xml.tag! "wsdl:operation", :name => "SmsNotificationGeneral" do
      xml.tag! "wsdl:input", :name => "smsNotificationGeneralRequest", :message => "xth:SmsNotificationGeneralOperationRequest"
      xml.tag! "wsdl:output", :name => "smsNotificationGeneralReply", :message => "xth:SmsNotificationGeneralOperationReply"
    end
  end

  xml.tag! "wsdl:binding", :name => "btpnNotificationServicesSOAP", :type => "xth:btpnNotificationServicesPortType" do
    xml.tag! "soap:binding", :style => 'document', :transport => 'http://schemas.xmlsoap.org/soap/http'
    xml.tag! "wsdl:operation", :name => "SmsNotificationGeneral" do
      xml.tag! "soap:operation", :soapAction => "http://pegasus/integration/BtpnNotificationService/SmsNotificationGeneral"
      xml.tag! "wsdl:input", :name => "smsNotificationGeneralRequest" do
        xml.tag! "soap:body",
          :use => "literal"
      end
      xml.tag! "wsdl:output", :name => "smsNotificationGeneralReply" do
        xml.tag! "soap:body",
          :use => "literal"
      end
    end
  end

  xml.tag! "wsdl:service", :name => "btpnNotificationService" do
    xml.tag! "wsdl:port", :name => "btpnNotificationServicesPortType", :binding => "xth:btpnNotificationServicesSOAP" do
      xml.tag! "soap:address", :location => WashOut::Router.url(request, @name)
    end
  end
end
