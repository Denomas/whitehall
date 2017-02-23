module PublishingApi
  class CorporateInformationPagePresenter
    extend Forwardable
    include UpdateTypeHelper

    attr_reader :update_type

    def initialize(corporate_information_page, update_type: nil)
      self.corporate_information_page = corporate_information_page
      self.update_type =
        update_type || default_update_type(corporate_information_page)
    end

    def_delegator :corporate_information_page, :content_id

    def content
      BaseItemPresenter
        .new(corporate_information_page)
        .base_attributes
    end

  private

    attr_accessor :corporate_information_page
    attr_writer :update_type
  end
end
