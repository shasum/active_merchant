module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    # SepaBankAccount object is similar to Check. It supports validation
    # of necessary attributes such as IBAN and account owner name.
    #
    # You may use it in place of CreditCard with any gateway that supports it.
    class SepaBankAccount < Model
      attr_accessor :iban, :owner_name, :country_code

      def validate
        errors = []

        [:iban, :owner_name].each do |attr|
          errors << [attr, 'cannot be empty'] if empty?(self.send(attr))
        end

        errors_hash(errors)
      end

      def type
        'sepa_bank_account'
      end

      def credit_card?
        false
      end
    end
  end
end
