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

  OPCIONALES = [
    {:id=>"2",    :desc=>"RG Empresas Promovidas - Indentificador de proyecto vinculado a Régimen de Promoción Industrial"},
    {:id=>"91",   :desc=>"RG Bienes Usados 3411 - Nombre y Apellido o Denominación del vendedor del bien usado."},
    {:id=>"92",   :desc=>"RG Bienes Usados 3411 - Nacionalidad del vendedor del bien usado."},
    {:id=>"93",   :desc=>"RG Bienes Usados 3411 - Domicilio del vendedor del bien usado."},
    {:id=>"5",    :desc=>"Excepcion computo IVA Credito Fiscal"},
    {:id=>"61",   :desc=>"RG 3668 Impuesto al Valor Agregado - Art.12 IVA Firmante Doc Tipo"},
    {:id=>"62",   :desc=>"RG 3668 Impuesto al Valor Agregado - Art.12 IVA Firmante Doc Nro"},
    {:id=>"7",    :desc=>"RG 3668 Impuesto al Valor Agregado - Art.12 IVA Carácter del Firmante"},
    {:id=>"10",   :desc=>"RG 3.368 Establecimientos de educación pública de gestión privada - Actividad Comprendida"},
    {:id=>"1011", :desc=>"RG 3.368 Establecimientos de educación pública de gestión privada - Tipo de Documento"},
    {:id=>"1012", :desc=>"RG 3.368 Establecimientos de educación pública de gestión privada - Número de Documento"},
    {:id=>"11",   :desc=>"RG 2.820 Operaciones económicas vinculadas con bienes inmuebles - Actividad Comprendida"},
    {:id=>"12",   :desc=>"RG 3.687 Locación temporaria de inmuebles con fines turísticos - Actividad Comprendida"},
    {:id=>"13",   :desc=>"RG 2.863 Representantes de Modelos"},
    {:id=>"14",   :desc=>"RG 2.863 Agencias de publicidad"},
    {:id=>"15",   :desc=>"RG 2.863 Personas físicas que desarrollen actividad de modelaje"},
    {:id=>"17",   :desc=>"RG 4004-E Locación de inmuebles destino 'casa-habitación'. Dato 2 (dos) = facturación directa / Dato 1 (uno) = facturación a través de intermediario"},
    {:id=>"1801", :desc=>"RG 4004-E Locación de inmuebles destino 'casa-habitación'. Clave Única de Identificación Tributaria (CUIT)."},
    {:id=>"1802", :desc=>"RG 4004-E Locación de inmuebles destino 'casa-habitación'. Apellido y nombres, denominación y/o razón social."},
    {:id=>"2101", :desc=>"Factura de Crédito Electrónica MiPyMEs (FCE) - CBU del Emisor"},
    {:id=>"2102", :desc=>"Factura de Crédito Electrónica MiPyMEs (FCE) - Alias del Emisor"},
    {:id=>"22",   :desc=>"Factura de Crédito Electrónica MiPyMEs (FCE) - Anulación"},
    {:id=>"23",   :desc=>"Factura de Crédito Electrónica MiPyMEs (FCE) - Referencia Comercial"}
  ]

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