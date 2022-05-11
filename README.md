These are a set of examples on how to deploy and customize Rancher addons via fleet.

The idea is to have one git-repo per addon and then add these addons as gitrepo objects in the rancher cluster.

- In the fleet-default namespace for the downstream clusters

- In the fleet-local namespace for the Rancher cluster itself

The gitepo rke-cluster-fleet contains the git and helm auth objects and the gitrepo objects.
