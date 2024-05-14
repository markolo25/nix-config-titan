{ config, lib, pkgs, ... }:
services.nas = {
  enable = true;
  # Shares to configure with sensible defaults for Samba/NFS
  shares = {
    Amanda = {
        path = /mnt/athena/Amanda;
        nfs.enable = false;
    }
    Downloads = {
        path = /mnt/athena/Downloads;
        nfs.enable = true;
    }
    Mark = {
        path = /mnt/athena/Mark;
        nfs.enable = false;
    }
    pwmanager = {
        path = /mnt/athena/pwmanager;
        nfs.enable = false;
    }
    Share = {
        path = /mnt/athena/Share;
        nfs.enable = false;
    }
    torrentclient = {
        path = /mnt/athena/torrentclient;
        nfs.enable = false;
    }
    Video = {
        path = /mnt/athena/Video;
        nfs.enable = true;
    }
  }
};