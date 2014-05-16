module YoutubeHelper
  def id_video(url)
    (a = url["?v="]) ? url.split("?v=")[1] : url.split("/")[-1]
  end
end