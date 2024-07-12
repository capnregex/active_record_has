class TagsImporter < DataImp::Porter
  def import
    Tag.find_or_create_by(name: name)
  end
end

