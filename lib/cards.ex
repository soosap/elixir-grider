defmodule Cards do
	def create_deck do
		values = ["Ace", "Two", "Three", "Four", "Five"]
		suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

		for suit <- suits, value <- values do
			"#{value} of #{suit}"
		end
	end

	def shuffle(deck) do
		Enum.shuffle(deck)
	end

	def contains?(deck, hand) do
		Enum.member?(deck, hand)
	end

	def deal(deck, hand_size) do
		Enum.split(deck, hand_size)
	end

	def save(deck, filename) do
		binary = :erlang.term_to_binary(deck)
		File.write(filename, binary)
	end

	def load(filename) do
		case File.read(filename) do
			{:ok, binary} -> :erlang.binary_to_term binary
		  {:error, _reason} -> "That file does not exist!" 
		end
	end

	def create_hand(hand_size) do
		# deck = Cards.create_deck
		# deck = Cards.shuffle(deck)
		# hand = Cards.deal(deck, hand_size)

		# Using elixir's pipe operator:
		# Elixir will pass on the result of a particular command as the first argument to the next command.
		Cards.create_deck
		|> Cards.shuffle
		|> Cards.deal(hand_size)
	end
end
