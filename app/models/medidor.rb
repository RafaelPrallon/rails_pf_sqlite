class Medidor < ActiveRecord::Base
  belongs_to :local
  has_many :medicaos
end
