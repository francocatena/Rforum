class Board < ActiveRecord::Base
  default_scope :order => 'id'

  has_many :conversations
  validates :title, :uniqueness=>true
  validates :title,:descripcion, :presence => true

  validates_length_of :title, :maximum => 50

  scope :foros, lambda{ |padre| where('padre = ?' , padre)}

  def self.padres
    foro = Board.foros(0)
    forosprincipales = foro + Board.principales
  end

  def self.principales
    principales=Board.foros(1)
  end
end
