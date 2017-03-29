class SubcategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id
  has_many :concepts, serializer: ConceptSerializer
end
