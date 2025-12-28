{ pkgs, pkgsStable, config, lib, ...}:
# all my virtualisation needs are declared here, like qemu/kvm and docker

{ 

  programs = {
    virt-manager.enable = true;
    dconf.enable = true; #virt-manager wont remember stuff without
  };



  users.groups.libvirtd.members = ["hedwig"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
  
#  virtualisation.docker.enable = true;




  # GNS3
  users.users.hedwig= {
     
        packages = with pkgs; [ 
    
        gns3-gui 
        ];
      };
  environment.systemPackages = with pkgs; [
    wlvncc
  ];
#  services.gns3-server = {
#    package = pkgsStable.gns3-server; 
#    enable = true;
    #settings = { 
    #  Server = {
    #    images_path = "/home/hedwig/GNS3/images";
    #    projects_path = "/home/hedwig/GNS3/projects";
    #  };
   # };
    


#  };
  services.gns3-server.ubridge.enable = true;
  # Enable ISC DHCP Server


}
