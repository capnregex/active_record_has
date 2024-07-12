# frozen_string_literal: true

DataImp.data_dir Rails.root.join("db/data").to_s
DataImp.import_list <<~LIST
  categories.yaml
LIST
