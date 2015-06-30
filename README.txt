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
3) Create your monitoring agent config
   - /opt/rackspace-monitoring-agent/usr/bin/rackspace-monitoring-agent  --setup --username YOUR_USERNAME --apikey YOUR_KEY
4) Move monitoring agent config at /opt/rackspace-monitoring-agent/etc/rackspace-monitoring-agent.conf.d/
   - mv /etc/rackspace-monitoring-agent.cfg /opt/rackspace-monitoring-agent/etc/rackspace-monitoring-agent.conf.d/
5) Set to run under systemd
   - cp rackspace-monitoring-agent.service /etc/systemd/system/
   - systemctl enable /etc/systemd/system/rackspace-monitoring-agent.service
   - systemctl start rackspace-monitoring-agent.service
