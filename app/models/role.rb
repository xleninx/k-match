class Role < EnumerateIt::Base
  associate_values(
    :Prospective   => [0, 'Prospective'],
    :Current  => [1, 'Current'],
    :Leader    => [2, 'Leader'],
    :Admin => [3, 'Admin']
  )
end
