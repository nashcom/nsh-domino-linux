# How to Run Domino on Linux

Domino can be installed in multiple ways on Linux.
The best choice depends on your infrastructure, available know-how, and operational requirements.


## Run Domino on a Virtual or Physical Machine

The classical and still most common approach is to run Domino on a physical or virtual machine.
For many environments, this remains the most straightforward and stable deployment model.


### Partitioned Servers

In earlier days, Domino was often installed on large physical machines using partitioned servers to optimize hardware utilization.
Over the last decade the industry has shifted toward virtualization, and today small, dedicated virtual machines are usually better suited than multiple partitions on a single host.

Partitioned servers are still supported, but modern infrastructure makes VM-based separation easier to manage and scale.


## Run Domino on Docker

A more modern approach is to run Domino using container images on Docker or Podman.

Containerization provides a lightweight virtualization layer that encapsulates a minimal Linux distribution, Domino binaries, templates, and automated initialization logic.
Templates and configuration are applied on first start and automatically re-applied or updated on subsequent image upgrades.


### Benefits of Using Containers

* **Simplified lifecycle management**
  Stop the container, replace it with a new image, and start it again. No in-place upgrades required.

* **Consistent environments**
  Develop, test, and deploy using the *same* image to avoid configuration drift.

* **Reduced downtime during updates**
  Image replacement is fast and predictable.

* **Automated installation of add-ons**
  Add-ons, tools, or customizations can be baked into the image and shipped as part of the build-and-deploy pipeline.

* **Better portability**
  Containers can run on Docker, Podman, or be moved into Kubernetes later as the environment evolves.


## Run Domino on Kubernetes (K8s)

Domino can also run efficiently on Kubernetes — **if the IT team has the appropriate skills and already follows a Kubernetes strategy**.
Kubernetes becomes especially useful in larger, fully automated environments where elasticity, standardized deployments, and GitOps workflows matter.

Domino container images are K8s-ready, but storage and networking require careful planning.


### Storage Considerations

General-purpose Kubernetes storage often lacks the high I/O throughput required for larger Domino servers.
Performance issues typically arise when the underlying CSI driver or storage backend cannot meet Domino’s latency and IOPS expectations.

Important considerations:

* Use storage with **low latency and high IOPS** (e.g., iSCSI, Fibre Channel, high-performance NVMe-backed CSI drivers).
* Avoid generic NFS storage for NSF and transaction logs unless the NFS backend has enterprise-grade performance.
* For DAOS, scalable object storage or NFS with proper caching/deduplication can work well.


### Operational Notes

* Kubernetes provides **self-healing**, **rolling updates**, and **declarative configuration**, which can be powerful for Domino.
* A Kubernetes setup typically requires **more upfront investment** in automation, monitoring, and storage design.
* Kubernetes is not a performance optimization; it’s an **operations optimization**. For small environments, it may be unnecessary overhead.

