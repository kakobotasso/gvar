class ReceiptFactory
  @struct = OpenStruct.new

  def self.new_receipt(object)
    return receipt_from_schedule(object)     if object.instance_of? Schedule
    return receipt_from_registration(object) if object.instance_of? Registration
  end

  def self.receipt_from_schedule(object)
    @struct.code        = object.code
    @struct.name        = object.client.name
    @struct.cpf         = object.client.cpf
    @struct.description = object.observations

    @struct
  end

  def self.receipt_from_registration(object)
    @struct.code        = object.code
    @struct.name        = object.student.name
    @struct.cpf         = object.student.cpf
    @struct.description = object.team.note

    @struct
  end
end
