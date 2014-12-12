require "duty_calculator/client"

module DutyCalculator
  class ErrorMessages
    ERRORS = {"4042" => "Specified API key could not be used with API 2.1",
              "4043" => "This API key is for sandbox access only",
              "4044" => "Request URI is invalid",
              "4045" => "Access denied to the specified calculation. It belongs to a different user.",
              "4046" => "Client id is invalid or missing",
              "4061" => "Account does not support called service: Classification service - get HS codes, duty & tax rates and import restrictions",
              "4062" => "Account does not support called service: Documents service",
              "4063" => "Account does not support called operation: Classification service - get DutyCalculator item ID",
              "4064" => "Account does not support called operation: Reporting service","4401" => "Parameter is missing",
              "4421" => "Bad parameter: shipping cost can't be empty",
              "4422" => "Bad parameter: shipment weight can't be empty",
              "4423" => "Bad parameter: imported weight can't be empty",
              "4424" => "Bad parameter: imported value can't be empty",
              "4425" => "Bad parameter: insurance value can't be empty",
              "4426" => "Bad parameter: both category and description for reference <product reference> can't be empty",
              "4427" => "Bad parameter: SKU for reference <product reference> can't be empty",
              "4428" => "Bad parameter: HS code for reference <product reference> can't be empty",
              "4429" => "Bad parameter: description for reference <product reference> can't be empty","4701" => "Bad parameter: <parameter name> is invalid",
              "4721" => "Classification for the selected import to country is not possible",
              "4722" => "Bad parameter: country from code",
              "4723" => "Bad parameter: country to code",
              "4724" => "Bad parameter: country province to code",
              "4725" => "Bad parameter: currency code",
              "4726" => "Bad parameter: output currency code",
              "4727" => "Bad parameter: importer status",
              "4728" => "Bad parameter: products count is zero",
              "4729" => "Bad parameter: values count is not equal with products count",
              "4730" => "Bad parameter: DutyCalculator Item ID for reference <product reference> is invalid",
              "4731" => "Bad parameter: quantity for reference <product reference>  is invalid",
              "4732" => "Bad parameter: weight for reference <product reference> is invalid",
              "4733" => "Bad parameter: amount for reference <product reference>  is invalid",
              "4734" => "Bad parameter: amount unit for reference <product reference> should be one of the following: pcs, doz, gr",
              "4735" => "Bad parameter: country of origin",
              "4736" => "Bad parameter: classify_by",
              "4737" => "Bad parameter: not all SKU stock keeping units have been classified",
              "4738" => "Bad parameter: HS code for reference <product reference> could not be matched. Please file classification request",
              "4739" => "Bad parameter: duty calculation id",
              "4740" => "Bad parameter: internal order id",
              "4741" => "Bad parameter: internal shipment id",
              "4742" => "Bad parameter: internal credit note id",
              "4743" => "Bad parameter: order type",
              "4745" => "Bad parameter: product reference <product reference> not found",
              "4746" => "Bad parameter: HS codes count is not equal with descriptions count",
              "4747" => "Reference <product reference> could not be autoclassified",
              "4755" => "Bad parameter: shipping mode is invalid"}
    def self.for_code(code)
      ERRORS[code]
    end
  end
end
