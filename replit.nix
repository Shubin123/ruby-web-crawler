{ pkgs }: {
	deps = [
        pkgs.ruby_3_0
        pkgs.ruby_3_0
        pkgs.bundle exec ruby main.rb https://www.google.com/ https://www.reddit.com/ <website-url> ...
        pkgs.ruby_3_0
        pkgs.rubyPackages_3_0.solargraph
        pkgs.rufo
	];
}