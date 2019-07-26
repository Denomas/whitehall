class DocumentCollectionGroupMembership < ApplicationRecord
  BANNED_DOCUMENT_TYPES = %w[DocumentCollection].freeze
  include LockedDocumentConcern

  belongs_to :document, inverse_of: :document_collection_group_memberships
  belongs_to :document_collection_group, inverse_of: :memberships

  before_create :assign_ordering

  before_save { check_if_locked_document(document: self.document) }

  validates :document, presence: true
  validates :document_collection_group, presence: true
  validate :document_is_of_allowed_type, if: -> { document.present? }

private

  def assign_ordering
    self.ordering = document_collection_group.documents.size + 1
  end

  def document_is_of_allowed_type
    if BANNED_DOCUMENT_TYPES.include? document.document_type
      errors.add(:document, "cannot be a #{document.humanized_document_type}")
    end
  end
end
