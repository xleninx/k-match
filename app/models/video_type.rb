class VideoType < EnumerateIt::Base
  associate_values(
    :Main   => [1, 'Main'],
    :Secundary  => [2, 'Secundary']
  )
end
