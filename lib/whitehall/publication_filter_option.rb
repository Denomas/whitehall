module Whitehall
  class PublicationFilterOption < FilterOption
    attr_accessor :publication_types

    Consultation        = create(id: 1, slug: "consultations", label: "All consultations", search_format_types: %w[publicationesque-consultation], publication_types: [], edition_types: %w[Consultation], group_key: "Consultations")
    OpenConsultation    = create(id: 2, label: "Open consultations", search_format_types: %w[consultation-open], publication_types: [], edition_types: %w[Consultation], group_key: "Consultations")
    ClosedConsultation  = create(id: 3, label: "Closed consultations", search_format_types: %w[consultation-closed consultation-outcome], publication_types: [], edition_types: %w[Consultation], group_key: "Consultations")
    PolicyPaper         = create(id: 5, label: "Policy papers", search_format_types: PublicationType::PolicyPaper.search_format_types, publication_types: [PublicationType::PolicyPaper], group_key: "Policy and guidance")
    Guidance            = create(id: 6, label: "Guidance", search_format_types: PublicationType::Guidance.search_format_types, publication_types: [PublicationType::Guidance, PublicationType::StatutoryGuidance], group_key: "Policy and guidance")
    ImpactAssessment    = create(id: 7, label: "Impact assessments", search_format_types: PublicationType::ImpactAssessment.search_format_types, publication_types: [PublicationType::ImpactAssessment], group_key: "Policy and guidance")
    IndependentReport   = create(id: 8, label: "Independent reports", search_format_types: PublicationType::IndependentReport.search_format_types, publication_types: [PublicationType::IndependentReport], group_key: "Policy and guidance")
    Correspondence      = create(id: 9, label: "Correspondence", search_format_types: PublicationType::Correspondence.search_format_types, publication_types: [PublicationType::Correspondence], group_key: "Policy and guidance")
    ResearchAndAnalysis = create(id: 10, label: "Research and analysis", search_format_types: PublicationType::ResearchAndAnalysis.search_format_types, publication_types: [PublicationType::ResearchAndAnalysis], group_key: "Research and statistics")
    Statistics          = create(id: 11, label: "Statistics", search_format_types: %w[publicationesque-statistics], publication_types: [PublicationType::OfficialStatistics, PublicationType::NationalStatistics], edition_types: %w[StatisticalDataSet], group_key: "Research and statistics")
    CorporateReport     = create(id: 12, label: "Corporate reports", search_format_types: PublicationType::CorporateReport.search_format_types, publication_types: [PublicationType::CorporateReport], group_key: "Corporate")
    TransparencyData    = create(id: 13, label: "Transparency data", search_format_types: PublicationType::TransparencyData.search_format_types, publication_types: [PublicationType::TransparencyData], group_key: "Corporate")
    FoiRelease          = create(id: 14, label: "FOI releases", search_format_types: PublicationType::FoiRelease.search_format_types, publication_types: [PublicationType::FoiRelease], group_key: "Corporate")
    Form                = create(id: 15, label: "Forms", search_format_types: PublicationType::Form.search_format_types, publication_types: [PublicationType::Form], group_key: "Other")
    Map                 = create(id: 16, label: "Maps", search_format_types: PublicationType::Map.search_format_types, publication_types: [PublicationType::Map], group_key: "Other")
    InternationalTreaty = create(id: 17, label: "International treaties", search_format_types: PublicationType::InternationalTreaty.search_format_types, publication_types: [PublicationType::InternationalTreaty], group_key: "Other")
    PromotionalMaterial = create(id: 18, label: "Promotional material", search_format_types: PublicationType::PromotionalMaterial.search_format_types, publication_types: [PublicationType::PromotionalMaterial], group_key: "Other")
    Notice              = create(id: 20, label: "Notices", search_format_types: PublicationType::Notice.search_format_types, publication_types: [PublicationType::Notice], group_key: "Other")
    Decision            = create(id: 21, label: "Decisions", search_format_types: PublicationType::Decision.search_format_types, publication_types: [PublicationType::Decision], group_key: "Other")
    Regulation          = create(id: 22, label: "Regulations", search_format_types: PublicationType::Regulation.search_format_types, publication_types: [PublicationType::Regulation], group_key: "Other")
  end
end
