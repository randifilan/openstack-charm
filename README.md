# Canonical Charm OpenStack

This Guide deploy this OpenStack Charm Component
```
| No  | Service                | Function                                                 | Replica | Node                                               |
|-----|------------------------|----------------------------------------------------------|---------|---------------------------------------------------|
| 1   | Keystone               | OpenStack Identity Service                               | 2       | rf-compute-02, rf-compute-03                      |
| 2   | Glance                 | OpenStack Image Registry                                 | 2       | rf-compute-02, rf-compute-03                      |
| 3   | Nova                   | OpenStack Compute                                        | 2       | rf-compute-02, rf-compute-03                      |
| 4   | Neutron                | OpenStack Neutron                                        | 2       | rf-compute-02, rf-compute-03                      |
| 5   | Placement              | OpenStack Placement Service                              | 2       | rf-compute-02, rf-compute-03                      |
| 6   | Horizon                | OpenStack Dashboard                                      | 2       | rf-compute-02, rf-compute-03                      |
| 7   | Cinder                 | OpenStack Block Storage Service                          | 2       | rf-compute-02, rf-compute-03                      |
| 8   | Heat                   | OpenStack Orchestration Engine                           | 2       | rf-compute-02, rf-compute-03                      |
| 9   | Masakari               | OpenStack Instances High Availability Service            | 2       | rf-compute-02, rf-compute-03                      |
| 10  | Aodh                   | OpenStack Telemetry - Alarming Service                   | 2       | rf-compute-02, rf-compute-03                      |
| 11  | Gnoochi                | Multi-tenant timeseries, metrics, and resource           | 2       | rf-compute-02, rf-compute-03                      |
| 12  | Ceilometer             | OpenStack Telemetry - Metering & Data Collection Service | 2       | rf-compute-02, rf-compute-03                      |
| 13  | Barbican               | OpenStack Key Manager                                    | 2       | rf-compute-02, rf-compute-03                      |
| 14  | Octavia                | OpenStack Load Balancer                                  | 2       | rf-compute-02, rf-compute-03                      |
| 15  | Ceph Mon               | Ceph Mon and Ceph MGR                                    | 3       | rf-compute-01-gpu, rf-compute-02, rf-compute-03   |
| 16  | Ceph OSD               | Ceph OSD Disk                                            | 3       | rf-compute-01-gpu, rf-compute-02, rf-compute-03   |
| 17  | Ceph Dashboard         | Ceph Dashboard                                           | 3       | rf-compute-01-gpu, rf-compute-02, rf-compute-03   |
| 18  | Memcached              | A high-performance memory object caching system          | 2       | rf-compute-02, rf-compute-03                      |
| 19  | MySQL InnoDB Cluster   | MySQL InnoDB Cluster                                     | 3       | rf-compute-01-gpu, rf-compute-02, rf-compute-03   |
| 20  | RabbitMQ Cluster       | RabbitMQ Cluster                                         | 3       | rf-compute-01-gpu, rf-compute-02, rf-compute-03   |
| 21  | Vault                  | A tool for Managing Secrets (Backend for Barbican)       | 2       | rf-compute-02, rf-compute-03                      |
```


```
juju status
Model          Controller     Cloud/Region  Version  SLA          Timestamp
openstack-poc  openstack-poc  maas-rf      3.5.4    unsupported  20:24:30+07:00

App                       Version  Status   Scale  Charm                   Channel        Rev  Exposed  Message
aodh                      16.0.0   active       2  aodh                    2023.1/stable  110  no       Unit is ready
aodh-mysql-router         8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
barbican                  16.0.0   active       2  barbican                2023.1/stable  150  no       Unit is ready
barbican-mysql-router     8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
barbican-vault            4.1.0    active       2  barbican-vault          2023.1/stable   68  no       Unit is ready
ceilometer                20.0.0   active       2  ceilometer              2023.1/stable  554  no       Unit is ready
ceilometer-agent          20.0.0   active       3  ceilometer-agent        2023.1/stable  515  no       Unit is ready
ceph-dashboard                     active       3  ceph-dashboard          quincy/stable   52  no       Unit is ready
ceph-dashboard-lb                  active       2  openstack-loadbalancer  jammy/stable    10  no       Unit is ready
ceph-mon                  17.2.7   active       3  ceph-mon                quincy/stable  243  no       Unit is ready and clustered
ceph-osd                  17.2.7   active       3  ceph-osd                quincy/stable  622  no       Unit is ready (1 OSD)
cinder                    22.1.1   active       2  cinder                  2023.1/stable  693  no       Unit is ready
cinder-backup             22.1.1   active       2  cinder-backup           2023.1/stable   76  no       Unit is ready
cinder-ceph               22.1.1   active       2  cinder-ceph             2023.1/stable  524  no       Unit is ready
cinder-mysql-router       8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
dashboard-mysql-router    8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
glance                    26.0.0   active       2  glance                  2023.1/stable  623  no       Unit is ready
glance-mysql-router       8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
gnocchi                   4.5.0    active       2  gnocchi                 2023.1/stable  190  no       Unit is ready
gnocchi-mysql-router      8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
ha-aodh                   2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-barbican               2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-ceilometer             2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-ceph-dashboard-lb      2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-cinder                 2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-glance                 2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-gnocchi                2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-heat                   2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-keystone               2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-masakari               2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-neutron-api            2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-nova-cloud-controller  2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-octavia                2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-openstack-dashboard    2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-placement              2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
ha-vault                  2.1.2    active       2  hacluster               2.4/stable     131  no       Unit is ready and clustered
heat                      20.0.0   active       2  heat                    2023.1/stable  551  no       Unit is ready
heat-mysql-router         8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
keystone                  23.0.1   active       2  keystone                2023.1/stable  684  no       Application Ready
keystone-mysql-router     8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
masakari                  15.0.0   active       2  masakari                2023.1/stable   76  no       Unit is ready
masakari-monitors         15.0.0   active       2  masakari-monitors       2023.1/stable   75  no       Unit is ready
masakari-mysql-router     8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
memcached                          active       2  memcached               latest/stable   39  no       Unit is ready and clustered
mysql-innodb-clusters     8.0.40   active       3  mysql-innodb-cluster    8.0/stable     153  no       Unit is ready: Mode: R/O, Cluster is ONLINE and can tolerate up to ONE failure.
ncc-mysql-router          8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
neutron-api               22.1.0   active       2  neutron-api             2023.1/stable  595  no       Unit is ready
neutron-api-mysql-router  8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
neutron-gateway           22.1.0   active       2  neutron-gateway         2023.1/stable  531  no       Unit is ready
neutron-openvswitch       20.5.0   active       5  neutron-openvswitch     2023.1/stable  535  no       Unit is ready
nova-cloud-controller     27.4.0   active       2  nova-cloud-controller   2023.1/stable  757  no       Unit is ready
nova-compute              27.4.0   active       2  nova-compute            2023.1/stable  755  no       Unit is ready
nova-compute-gpu          27.4.0   active       1  nova-compute            2023.1/stable  755  no       Unit is ready
ntp                       4.2      active       3  ntp                     latest/stable   50  no       chrony: Ready
octavia                   10.1.1   active       2  octavia                 2023.1/stable  339  no       Unit is ready
octavia-dashboard         11.0.0   active       2  octavia-dashboard       2023.1/stable   86  no       Unit is ready
octavia-mysql-router      8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
openstack-dashboard       23.2.0   active       2  openstack-dashboard     2023.1/stable  681  no       Unit is ready
pacemaker-remote                   active       2  pacemaker-remote        jammy/stable    23  no       Unit is ready
placement                 9.0.0    active       2  placement               2023.1/stable   90  no       Unit is ready
placement-mysql-router    8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
rabbitmq-server           3.9.27   active       3  rabbitmq-server         3.9/stable     188  no       Unit is ready and clustered
vault                     1.8.8    active       2  vault                   1.8/stable     372  no       Unit is ready (active: true, mlock: disabled)
vault-mysql-router        8.0.40   active       2  mysql-router            8.0/stable     257  no       Unit is ready
```
