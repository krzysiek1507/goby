class Tile

	# @param [Hash] params the parameters for creating a Tile.
  # @option params [Boolean] :passable if true, the player can move here.
	# @option params [Boolean] :seen if true, it will be printed on the map.
	# @option params [String] :description a summary/message of the contents.
	# @option params [[Event]] :events the events found on this tile.
	# @option params [[Monster]] :monsters the monsters found on this tile.
	def initialize(params = {})
		if params[:passable].nil? then @passable = true
    else @passable = params[:passable] end

		if params[:seen].nil? then @seen = false
    else @seen = params[:seen] end

		@description = params[:description] || ""
		@events = params[:events] || Array.new
		@monsters = params[:monsters] || Array.new
	end

	# @param [Tile] rhs the tile on the right.
	def ==(rhs)
		return (@passable == rhs.passable &&
						@seen == rhs.seen &&
						@description == rhs.description)
	end

	attr_accessor :passable, :seen, :description, :events, :monsters

end
