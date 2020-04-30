module Afip
  CBTE_TIPO = {
    "01"=>"Factura A",
    "02"=>"Nota de Débito A",
    "03"=>"Nota de Crédito A",
    "06"=>"Factura B",
    "07"=>"Nota de Debito B",
    "08"=>"Nota de Credito B",
    "11"=>"Factura C",
    "12"=>"Nota de Debito C",
    "13"=>"Nota de Credito C",
    "201" => "Factura de Crédito electrónica MiPyMEs (FCE) A",
    "202" => "Nota de Débito electrónica MiPyMEs (FCE) A",
    "203" => "Nota de Crédito electrónica MiPyMEs (FCE) A",
    "206" => "Factura de Crédito electrónica MiPyMEs (FCE) B",
    "207" => "Nota de Débito electrónica MiPyMEs (FCE) B",
    "208" => "Nota de Crédito electrónica MiPyMEs (FCE) B",
    "211" => "Factura de Crédito electrónica MiPyMEs (FCE) C",
    "212" => "Nota de Débito electrónica MiPyMEs (FCE) C",
    "213" => "Nota de Crédito electrónica MiPyMEs (FCE) C",
  }

  CONCEPTOS = {"Productos"=>"01", "Servicios"=>"02", "Productos y Servicios"=>"03"}

  DOCUMENTOS = {"CUIT"=>"80", "CUIL"=>"86", "CDI"=>"87", "LE"=>"89", "LC"=>"90", "CI Extranjera"=>"91", "en tramite"=>"92", "Acta Nacimiento"=>"93", "CI Bs. As. RNP"=>"95", "DNI"=>"96", "Pasaporte"=>"94", "Doc. (Otro)"=>"99"}

  MONEDAS = {
    :peso  => {:codigo => "PES", :nombre =>"Pesos Argentinos"},
    :dolar => {:codigo => "DOL", :nombre =>"Dolar Estadounidense"},
    :real  => {:codigo => "012", :nombre =>"Real"},
    :euro  => {:codigo => "060", :nombre =>"Euro"},
    :oro   => {:codigo => "049", :nombre =>"Gramos de Oro Fino"}
  }

  ALIC_IVA = [["01", "No gravado"], ["02", "Exento"],["03", 0], ["04", 0.105], ["05", 0.21], ["06", 0.27]]

  IVA_COND = ["Responsable Inscripto", "Responsable Monotributo"]

  BILL_TYPE = {
    :responsable_inscripto => {
      :responsable_inscripto => "01",
      :consumidor_final => "06",
      :exento => "06",
      :responsable_monotributo => "06",
      :nota_credito_a => "03",
      :nota_credito_b => "08",
      :nota_debito_a => "02",
      :nota_debito_b => "07"
    },
    :responsable_monotributo => {
      :responsable_inscripto => "11",
      :consumidor_final => "11",
      :exento => "11",
      :responsable_monotributo => "11",
      :nota_credito_c => "13",
      :nota_debito_c => "12"
    }
  }

  AVAILABLE_TYPES = {
    :responsable_inscripto => {
      :responsable_inscripto => ["01", "02", "03", "201", "202", "203"],
      :consumidor_final => ["06", "07", "08", "206", "207", "208"],
      :exento => ["06", "07", "08", "206", "207", "208"],
      :responsable_monotributo => ["06", "07", "08", "206", "207", "208"],
    },
    :responsable_monotributo => {
      :responsable_inscripto => ["11", "12", "13", "211", "212", "213"],
      :consumidor_final => ["11", "12", "13", "211", "212", "213"],
      :exento => ["11", "12", "13", "211", "212", "213"],
      :responsable_monotributo => ["11", "12", "13", "211", "212", "213"]
    }
  }
  
  URLS = 
    {
      :test => {
        :wsaa => 'https://wsaahomo.afip.gov.ar/ws/services/LoginCms',
        :padron => "https://awshomo.afip.gov.ar/sr-padron/webservices/personaServiceA5?WSDL",
        :wsfe => 'https://wswhomo.afip.gov.ar/wsfev1/service.asmx?WSDL'
      },
      :production => {
        :wsaa => 'https://wsaa.afip.gov.ar/ws/services/LoginCms',
        :padron => "https://aws.afip.gov.ar/sr-padron/webservices/personaServiceA5?WSDL",
        :wsfe => 'https://servicios1.afip.gov.ar/wsfev1/service.asmx' 
      }
    }
    
end