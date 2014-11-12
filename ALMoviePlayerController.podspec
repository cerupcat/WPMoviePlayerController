Pod::Spec.new do |s|
	s.name			= 'ALMoviePlayerController'
	s.version		= '0.3.0'
	s.summary		= 'A drop-in replacement for MPMoviePlayerController that exposes the UI elements and allows for maximum customization.'
	s.homepage		= 'https://github.com/cerupcat/ALMoviePlayerController'
	s.author		= { 'Anthony Lobianco' => 'anthony@lobian.co' }
	s.license 		= 'MIT'
	s.platform		= :ios, '7.1'
	s.requires_arc	= true
	s.source		= { :git => 'https://github.com/cerupcat/ALMoviePlayerController.git', :tag => s.version.to_s }
	s.source_files	= 'ALMoviePlayerController/*.{h,m}'
	s.resources		= 'ALMoviePlayerController/Images/*.{png}'
	s.frameworks	= 'QuartzCore', 'MediaPlayer'
end
