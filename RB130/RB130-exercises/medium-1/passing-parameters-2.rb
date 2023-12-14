birds = %w(raven finch hawk eagle)
raptors = []

def group_raptors(birds, raptors)
  raptors.concat(yield(birds))
end

group_raptors(birds, raptors) { |_, _, *r| r }

p raptors