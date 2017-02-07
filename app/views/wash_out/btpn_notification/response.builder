xml.tag! "soapenv:Envelope", "xmlns:soapenv" => 'http://schemas.xmlsoap.org/soap/envelope/',
                          "xmlns:btp" => "http://pegasus/integration/btpnnotification" do

  xml.tag! "soapenv:Body" do
    xml.tag! "btp:#{@action_spec[:response_tag]}" do
      xml.tag! "ResponseSmsNotifGeneral" do
        wsdl_data xml, result
      end
    end
  end
end
