This repository is some helper scripts for running the Rackspace Monitoring agent under CoreOS.

Due to the nature of the agent, it shouldn't be run in a Docker container as that will restrict
access to some of the things it might need to check. Instead we're going to put it in a 
systemd-nspawn container similar to what https://github.com/coreos/toolbox and
https://github.com/openstack/ironic-python-agent do.

1) Run ./build_agent_container.bash -- it will create rackspace-monitoring-agent-container.tar.xz
   this tarball contains a filesystem appropriate for a rackspace-monitoring-agent container.
2) Extract the container to /opt/rackspace-monitoring-agent:
   - mkdir -p /opt/rackspace-monitoring-agent
   - tar -x -C /opt/rackspace-monitoring-agent -f rackspace-monitoring-agent-container.tar.xz
