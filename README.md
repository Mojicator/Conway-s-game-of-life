# GameOfLife

Conway's Game of life, also known as the Game of Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970. It is the best-known example of a cellular automaton.

This game became widely known when it was mentioned in an article published by Scientific American in 1970. It consists of a collection of cells which, based on a few mathematical rules, can live, die or multiply. Depending on the initial conditions, the cells form various patterns throughout the course of the game.

## Rules

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square *cells*, each of which is in one of two possible states, **live** or **dead**. Every cell interacts with its eight neighbours, which are the cells that are directly horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

1. Any live cell with fewer than two live neighbours dies (*underpopulation* or *exposure*)
2. Any live cell with more than three live neighbours dies (*overpopulation* or *overcrowding*)
3. Any live cell with two or three live neighbours lives, unchanged, to the next generation.
4. Any dead cell with exactly three live neighbours will come to life.

The initial pattern constitutes the **seed** of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed — births and deaths happen simultaneously, and the discrete moment at which this happens is sometimes called a **tick**. (In other words, each generation is a pure function of the one before.) The rules continue to be applied repeatedly to create further generations.

## Installation

Download and install the gem directly from **pkg** directory.

```ruby
gem install ./pkg/game_of_life_om-0.1.0.gem
```

## Usage

In your ruby file add:

```ruby
require 'game_of_life'
```

and then

```ruby
GameOfLife.run
```

It will show a new window with playing the cellular automaton. **Have fun!**

## Development

To run the tests, run `rake test`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Mojicator/Conway-s-game-of-life
## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
