# Put your host names here
# all_hosts = [ 'localhost' ]
all_hosts = [ 'nagiosserver', 'client' ]


# List of filesystem types to skip at inventory
inventory_df_exclude_fs            = [ 'nfs', 'smbfs', 'cifs', 'iso9660' ]

# List of mountpoints to skipt at inventory
inventory_df_exclude_mountpoints   = [ '/dev' ]

#filesystem_default_levels["levels"] = ( 80.0, 90.0 )
#filesystem_default_levels["inode_levels"] = (  )

memused_default_levels = ( 50.0, 90.0 )
cpuload_default_levels = ( 0.1, 0.2 )

checks = [
   (["nagiosserver"], "cpu.loads", None, (0.5, 0.8)),
]
