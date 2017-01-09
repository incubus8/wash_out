xml.instruct!
xml.definitions 'xmlns' => 'http://schemas.xmlsoap.org/wsdl/',
                'xmlns:xth' => @namespace,
                'xmlns:soap' => 'http://schemas.xmlsoap.org/wsdl/soap/',
                'xmlns:xsd' => 'http://www.w3.org/2001/XMLSchema',
                'xmlns:wsdl' => 'http://schemas.xmlsoap.org/wsdl/',
                'name' => 'BtpnNotificationService',
                'targetNamespace' => @namespace do

  xml.types do
    xml.tag! "schema", :targetNamespace => @namespace, :xmlns => 'http://www.w3.org/2001/XMLSchema' do
      defined = []
      @map.each do |operation, formats|
        (formats[:in] + formats[:out]).each do |p|
          wsdl_type xml, p, defined
        end
      end
    end
  end

  xml.message :name => "SmsNotificationGeneralOperationRequest" do
    xml.part :name => "smsNotificationGeneralRequest", :type => "xth:ReqSmsNotifGeneral"
  end
  xml.message :name => "SmsNotificationGeneralOperationReply" do
    xml.part :name => "smsNotificationGeneralReply", :type => "xth:"
  end

  xml.portType :name => "btpnNotificationServicesPortType" do
    xml.operation :name => "SmsNotificationGeneral" do
      xml.input :name => "smsNotificationGeneralRequest", :message => "xth:SmsNotificationGeneralOperationRequest"
      xml.output :name => "smsNotificationGeneralReply", :message => "xth:SmsNotificationGeneralOperationReply"
    end
  end

  xml.binding :name => "btpnNotificationServicesSOAP", :type => "xth:btpnNotificationServicesPortType" do
    xml.tag! "soap:binding", :style => 'document', :transport => 'http://schemas.xmlsoap.org/soap/http'
    xml.operation :name => "SmsNotificationGeneral" do
      xml.tag! "soap:operation", :soapAction => "http://pegasus/integration/BtpnNotificationService/SmsNotificationGeneral"
      xml.input :name => "smsNotificationGeneralRequest" do
        xml.tag! "soap:body",
          :use => "literal"
      end
      xml.output :name => "smsNotificationGeneralReply" do
        xml.tag! "soap:body",
          :use => "literal"
      end
    end
  end

  xml.service :name => "btpnNotificationService" do
    xml.port :name => "btpnNotificationServicesPortType", :binding => "xth:btpnNotificationServicesSOAP" do
      xml.tag! "soap:address", :location => WashOut::Router.url(request, @name)
    end
  end
end
