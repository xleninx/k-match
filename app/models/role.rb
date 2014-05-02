class Role < EnumerateIt::Base
  associate_values(
    :single   => [0, 'Prospective'],
    :married  => [1, 'Current'],
    :widow    => [2, 'Leader'],
    :divorced => [3, 'Admin']
  )
end