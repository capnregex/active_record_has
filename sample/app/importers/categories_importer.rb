# frozen_string_literal: true

class CategoriesImporter < DataImp::Porter
  def import
    Category.find_or_create_by(name: name)
  end
end
