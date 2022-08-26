{ pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  users.users.josh = {
    isNormalUser = true;
    home = "/home/josh";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    # TODO(joshrosso): Josh to replace this with hashedPassword.
    password = "root";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCVyzpM8KL8OWXwC2Lcpe49zMdDGqQ8EQiygJSXmWqtGLw9We29/EAA5se7tvUzjgcTWZN/FFWl59Ba4QYJlRREPSuBy1M1urErR0elrfSNf1ORVNKINlWydDW57wg2/OW9hId1cvjaCha4GCt6gc+0ohRBG3wKBALUMMRcsvmOdRvHrKcIt5FIYdrl5vtKhxW5sj+uBZOjznj5ocAcwQ1u/EC7hzSucVrSdXT2ZCOapHBB6HVbxituQ5FQJn4OcW4sOdZPP0nbNlpX52IzlfBYO8JI4nx3d2qvBx4QRyrd8eRk/6B6U7iVATDuQgTyWcrmYtsi8ljmTcFM0xdiYA+3"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
