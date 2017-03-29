class ConceptSerializer < ActiveModel::Serializer
  attributes :id, :name, :subcategory_id, :description
end
