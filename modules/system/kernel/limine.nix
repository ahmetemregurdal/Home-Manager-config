{config, lib, pkgs, ...}:

{
	stylix.targets.limine.enable = true;
	boot.loader.limine = {
		enable = true;
		enableEditor = true;
	};
}
