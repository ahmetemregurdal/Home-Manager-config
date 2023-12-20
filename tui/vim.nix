{config, home-manager, pkgs, ...}:
{
	programs.vim = {
		enable = true;
		extraConfig = ''
			set nocp ai bs=2 hls ic is lbr ls=2 mouse=a nu ru sc scs smd so=3 sw=4 ts=4
			filetype plugin indent on
			syn on
		'';
		packageConfigurable = pkgs.vim;
	};
}
