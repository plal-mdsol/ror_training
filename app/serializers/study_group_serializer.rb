class StudyGroupSerializer < ActiveModel::Serializer
  # attributes :id
  attributes :StudyGroup, :studies 
  def studyGroups 
    object.name # self => serializer object, object =>current json
  end
  def sites 
    object.sites.map {|study| study.name.upcase}
  end
end
