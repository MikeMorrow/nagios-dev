# Put your host names here
# all_hosts = [ 'localhost' ]
all_hosts = [ 'nagiosserver', 'client' ]


# List of filesystem types to skip at inventory
inventory_df_exclude_fs            = [ 'nfs', 'smbfs', 'cifs', 'iso9660' ]

# List of mountpoints to skipt at inventory
inventory_df_exclude_mountpoints   = [ '/dev' ]

filesystem_default_levels["levels"] = ( 80.0, 90.0 )
