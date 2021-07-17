# frozen_string_literal: true

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    Card.faces[value][suit]
  end

  def ace?
    value.zero?
  end

  def ten?
    value > 8
  end

  def self.value(card, count_method, total)
    value = card.value + 1
    v = value > 9 ? 10 : value
    count_method == SOFT && v == 1 && total < 11 ? 11 : v
  end

  def self.faces
    [%w[🂡 🂱 🃁 🃑], %w[🂢 🂲 🃂 🃒], %w[🂣 🂳 🃃 🃓], %w[🂤 🂴 🃄 🃔],
     %w[🂥 🂵 🃅 🃕], %w[🂦 🂶 🃆 🃖], %w[🂧 🂷 🃇 🃗], %w[🂨 🂸 🃈 🃘],
     %w[🂩 🂹 🃉 🃙], %w[🂪 🂺 🃊 🃚], %w[🂫 🂻 🃋 🃛], %w[🂭 🂽 🃍 🃝],
     %w[🂮 🂾 🃎 🃞], %w[🂠]]
  end
end
