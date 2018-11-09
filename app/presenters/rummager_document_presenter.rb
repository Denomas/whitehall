##
## RummagerDocumentPresenter serves as a wrapper for documents returned in results
## provided by Rummager/Search API, in order to present documents in Finders.
##

class RummagerDocumentPresenter < ActionView::Base
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper

  attr_reader :title, :link, :display_type, :summary, :content_id

  def initialize(document_hash)
    @document = document_hash
    @link = @document.fetch('link', '')
    @title = @document.fetch('title', '')
    @display_type = @document.fetch('display_type', '')
    @summary = @document.fetch('description', '')
    @content_id = @document.fetch('content_id', '')
  end

  def publication_date
    I18n.l @document.fetch('public_timestamp', '').to_date, format: :long_ordinal
  end

  def public_timestamp
    @document.fetch('public_timestamp', '').to_time
  end

  def display_type_key
    @document.fetch('display_type', '')
  end

  def id
    # This matches the Atom FeedEntryPresenter in Collections:
    # https://github.com/alphagov/collections/blob/master/app/presenters/feed_entry_presenter.rb#L9
    "#{url}##{@document['public_timestamp'].to_date.rfc3339}"
  end

  def url
    Plek.current.website_root + link
  end

  def publication_collections
    links = @document.fetch('document_collections', []).map { |collection| format_link(collection["title"], collection["link"]) }.compact

    "Part of a collection: #{links.to_sentence}" if links.any?
  end

  def type
    @document.fetch('format', '')
  end

  def government_name
    @document.fetch('government_name', '')
  end

  def historic?
    @document.fetch('is_historic', false)
  end

  def organisations
    orgs = @document.fetch('organisations', []).map do |organisation|
      organisation.fetch('acronym', nil) || organisation.fetch('title', nil)
    end
    orgs.compact
    orgs.to_sentence if orgs.any?
  end

  def field_of_operation
    operational_field = @document.fetch('operational_field', '')
    "Field of operation: #{operational_field_link(operational_field)}" if operational_field.present?
  end

  # Returns a block of html:
  # "<time class=\"public_timestamp\" datetime=\"2018-09-19T17:06:34+01:00\">19 September 2018</time>"
  def display_date_microformat
    content_tag(:time, class: :public_timestamp, datetime: self.public_timestamp.iso8601) { self.publication_date }
  end

  def topics
    # Retuns nil as topics aren't rendered in the announcements finder.
    # This method is needed because the shared mustache template expects it to be available.
  end

private

  def format_link(title, link)
    link_to(title, Plek.current.website_root + link)
  end

  def operational_field_link(operational_field)
    path = "/government/fields-of-operation/#{operational_field}"
    format_link(operational_field.titleize, path)
  end
end
