xml.tag! "soapenv:Envelope", "xmlns:soapenv" => 'http://schemas.xmlsoap.org/soap/envelope/',
                          "xmlns:btp" => "http://pegasus/integration/btpnnotification" do
  if !header.nil?
    xml.tag! "soapenv:Header" do
      xml.tag! "btp:#{@action_spec[:response_tag]}" do
        wsdl_data xml, header
      end
    end
  end
  xml.tag! "soapenv:Body" do
    xml.tag! "btp:#{@action_spec[:response_tag]}" do
      wsdl_data xml, result
    end
  end
end
