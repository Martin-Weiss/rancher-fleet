FILES="gitrepo-auth-rke-cluster-fleet-fleet-local.yaml gitrepo-helm-auth-registry-robot-fleet-local.yaml gitrepo-rke-cluster-fleet-fleet-local.yaml"
OBJECTS="secret/gitrepo-auth-rke-cluster-fleet secret/gitrepo-helm-auth-registry-robot gitrepo/rke-cluster-fleet"
for FILE in $FILES; do 
	kubectl apply -f $FILE
done
	for OBJECT in $OBJECTS; do
		echo OBJECT is $OBJECT;
		kubectl -n fleet-local annotate $OBJECT meta.helm.sh/release-name=rke-cluster-fleet
		kubectl -n fleet-local annotate $OBJECT meta.helm.sh/release-namespace=fleet-local
		kubectl -n fleet-local label $OBJECT app.kubernetes.io/managed-by=Helm
	done
