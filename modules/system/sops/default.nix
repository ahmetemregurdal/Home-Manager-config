{config, lib, pkgs, ...}:

{
	sops = {
		defaultSopsFile = ../../../secrets.yaml;
	};
}
