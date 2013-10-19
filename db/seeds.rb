require_relative "../lib/modules/githubdataloader.rb"
include GitHubDataLoader
TIGER_SWALLOWTAILS = File.read(__FILE__).split(/^__END__/, 2).last.lines.map(&:chomp).reject(&:empty?)
tiger_info = TIGER_SWALLOWTAILS.map { |tiger| return_user_info(tiger) }
tigers_with_info = TIGER_SWALLOWTAILS.zip(tiger_info)
tiger_repos = TIGER_SWALLOWTAILS.map {|tiger| return_all_repos(tiger)}

tigers_with_info.each do |tiger| 
  Developer.create(github_username: tiger[0],
    email: tiger[1][:github_email],
    github_avatar: tiger[1][:github_avatar_link],
    github_url: tiger[1][:github_url])
end

tiger_repos.each do |tiger|
  tiger.each do |repo|
  Project.create(title: repo[:name],
    url: repo[:url],
    description: repo[:description],
    developer_id: (Developer.find_by github_username: repo[:owner]).id)
  end
end
__END__
MaxDavila
brunops
elreimundo
elmerwu
jonjchew
kierarad
ltrainpr
morganwildermuth
nathanallen
nscricco
nishantchandra
SunnyIzr
tomay
waneka
trostli
gary1410
roberttaraya
muchness
