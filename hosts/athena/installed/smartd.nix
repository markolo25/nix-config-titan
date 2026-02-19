{
  config,
  lib,
  pkgs,
  ...
}: {
  services.smartd = {
    enable = true;
    devices = [
	{
    device = "/dev/disk/by-id/ata-WDC_WD120EDAZ-11F3RA0_5PJJ5YUC";
}
{
    device = "/dev/disk/by-id/ata-WDC_WD120EMFZ-11A6JA0_Y5G58KZU";
}
{
    device = "/dev/disk/by-id/ata-WDC_WD140EDGZ-11B1PA0_9LKW8R8G";
}
{
    device = "/dev/disk/by-id/ata-WDC_WD140EDGZ-11B2DA2_2PGZR00T";
}
{
    device = "/dev/disk/by-id/ata-WDC_WD140EDGZ-11B2DA2_2PH4SB3T";
}
{
    device = "/dev/disk/by-id/scsi-35000039928994541";
}
{
    device = "/dev/disk/by-id/scsi-350000399386b5811";
}
{
    device = "/dev/disk/by-id/scsi-35000039938a02041";
}
{
    device = "/dev/disk/by-id/scsi-35000039948095ab9";
}
{
    device = "/dev/disk/by-id/scsi-35000039958382819";
}
{
    device = "/dev/disk/by-id/scsi-350000399584bd4dd";
}
{
    device = "/dev/disk/by-id/scsi-350000399584be281";
}
{
    device = "/dev/disk/by-id/scsi-350000399585365ad";
}
{
    device = "/dev/disk/by-id/scsi-3500003995893fe95";
}
{
    device = "/dev/disk/by-id/scsi-35000039968002a71";
}
{
    device = "/dev/disk/by-id/scsi-35000c500a7a03b93";
}
{
    device = "/dev/disk/by-id/scsi-35000c500a7a0405b";
}
{
    device = "/dev/disk/by-id/scsi-35000cca0506a2c24";
}
{
    device = "/dev/disk/by-id/scsi-35000cca050ae407c";
}
{
    device = "/dev/disk/by-id/scsi-35000cca050ae66a4";
}
{
    device = "/dev/disk/by-id/scsi-35000cca050b40e1c";
}
{
    device = "/dev/disk/by-id/scsi-35000cca253261b4c";
}
{
    device = "/dev/disk/by-id/scsi-35000cca2537c3838";
}
{
    device = "/dev/disk/by-id/scsi-35000cca2537c5580";
}
{
    device = "/dev/disk/by-id/wwn-0x5000039928994541";
}
{
    device = "/dev/disk/by-id/wwn-0x50000399386b5811";
}
{
    device = "/dev/disk/by-id/wwn-0x5000039938a02041";
}
{
    device = "/dev/disk/by-id/wwn-0x5000039948095ab9";
}
{
    device = "/dev/disk/by-id/wwn-0x5000039958382819";
}
{
    device = "/dev/disk/by-id/wwn-0x50000399584bd4dd";
}
{
    device = "/dev/disk/by-id/wwn-0x50000399584be281";
}
{
    device = "/dev/disk/by-id/wwn-0x50000399585365ad";
}
{
    device = "/dev/disk/by-id/wwn-0x500003995893fe95";
}
{
    device = "/dev/disk/by-id/wwn-0x5000039968002a71";
}
{
    device = "/dev/disk/by-id/wwn-0x5000c500a7a03b93";
}
{
    device = "/dev/disk/by-id/wwn-0x5000c500a7a0405b";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca0506a2c24";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca050ae407c";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca050ae66a4";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca050b40e1c";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca253261b4c";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca2537c3838";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca2537c5580";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca28ec26610";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca28ff6ad42";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca291e38b53";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca2c1cdf5b8";
}
{
    device = "/dev/disk/by-id/wwn-0x5000cca2c1d040ac";
}
    ];
  };
}
