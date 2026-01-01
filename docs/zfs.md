
# ZFS for Domino

[OpenZFS](https://openzfs.github.io/openzfs-docs/)


OpenZFS is a file-system class of it's own.
It comes with a couple of very interesting features, which makes it the perfect fit for small and larger environments.
For larger environments it needs special tuning and some higher amount of RAM to be effective. 

ZFS does not only is a file-system. It has an integrated volume manager and RAID support.
Additional disks can be added at any time and it is a great fit for local NVMe disks.

## ZFS Benefits in short

- copy-on-write (CoW), check-summing & data integrity, including self-healing
- integrated volume manager
- build-in RAID support
- adjustable record size per dataset
- compression
- de-duplication
- snapshots & clones
- snapshot send/receive (efficient remote replication)
- dataset quotas & reservations
- build-in NFS support
- native encryption- special vdevs for metadata/small files (NVMe acceleration)
- advanced adaptive caching (ARC) and optional SSD-based L2ARC
- ZIL/SLOG for low-latency synchronous writes (important for translog)

## Special considerations for Domino

# Record Size

The default record size on ZFS is 128K.
Domino (like other databases) uses smaller block writes.
A block size of 128K isn't a good fit and causes overhead.

In addition Domino translog crashes if the block size is larger than 32k and Create_R85_Log=1 is enabled to optimize disk I/O layout.

A record size which fits well for Domino would be 16k for Translog and NSF/NIF related data.
For DAOS the default 128k size fits well. 

# Compression

Block level compression is enabled by default and is well fitted for all Domino data.
The overhead for compression reduces the I/O rate.

# De-Duplication

De-duplication requires additional RAM which increases with higher storage volumes and should be implemented with care.

DAOS would be a candidate for de-duplication if certain conditions are met:

- Encryption and de-duplication would not be a good fit
- DAOS for one volume alone de-duplication would not bring much benefit
  It would be a good fit if more than one DAOS volume would be pointed to the same storage in different sub-directories (e.g. ZFS over NFS)

# Attributes

- Disable updating last accessed


