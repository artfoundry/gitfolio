class Chunk < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :project
end