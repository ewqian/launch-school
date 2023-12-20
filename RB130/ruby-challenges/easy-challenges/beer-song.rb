module BeerSongHelper
  idx_arr = []
  (0..299).step(3) { |i| idx_arr << i }
  VERSE_QUERY = ((0..99).to_a.zip idx_arr.reverse).to_h

  f = File.new('99-bottles-of-beer.txt', 'r')
  SONG_ARR = f.read.lines
  f.close
end

class BeerSong
  def self.verse(n)
    idx = BeerSongHelper::VERSE_QUERY[n]
    BeerSongHelper::SONG_ARR[idx..(idx + 1)].join
  end

  def self.verses(begin_n, end_n)
    start_idx = BeerSongHelper::VERSE_QUERY[begin_n]
    end_idx = BeerSongHelper::VERSE_QUERY[end_n] + 1
    BeerSongHelper::SONG_ARR[start_idx..end_idx].join
  end

  def self.lyrics
    BeerSongHelper::SONG_ARR.join
  end
end