class VideoType < EnumerateIt::Base
  associate_values(
    :Main   => [0, 'Main'],
    :Secundary  => [1, 'Secundary']
  )
end
