class Message < ApplicationRecord
  validates :author, presence: { message: "Escreva o seu nome." }
  validates :content, presence: { message: "Escreva o seu recado." }
  validates :content, length: { maximum: 280, message: "O recado pode ter no máximo 280 caracteres." }
  validates :color, inclusion: { in: %w[yellow pink blue green], message: "Escolha uma das cores da lista." }
end
