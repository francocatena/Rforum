class User < ActiveRecord::Base
  acts_as_authentic

  acts_as_voter

  has_many :comments, :dependent=>:destroy

  has_many :msjenviados, :class_name => 'Mensajepersonal', :foreign_key => 'remitente_id'
  has_many :msjrecibidos, :class_name => 'Mensajepersonal', :foreign_key => 'destinatario_id'

  has_many :usuario_cancions
end
