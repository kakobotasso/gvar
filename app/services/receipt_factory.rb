class ReceiptFactory
  @struct = OpenStruct.new

  def self.new_receipt(object)
    receipt_from_schedule(object)     if object.instance_of? Schedule
    receipt_from_registration(object) if object.instance_of? Registration
  end

  def self.receipt_from_schedule(object)
    @struct.code        = object.code
    @struct.name        = object.client.name
    @struct.cpf         = object.client.cpf
    @struct.description = object.description

    @struct
  end

  def self.receipt_from_registration(object)
    @struct.code        = object.code
    @struct.name        = object.client.name
    @struct.cpf         = object.client.cpf
    @struct.description = object.description

    @struct
  end
end
