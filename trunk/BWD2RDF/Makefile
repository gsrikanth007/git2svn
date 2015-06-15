CP="rdf-exporter-1.0-SNAPSHOT.jar:/usr/share/java/mysql-connector-java.jar"

run:
	java -cp $(CP) eionet.rdfexport.Execute -z -f bwd.properties -o bwd.rdf.gz
	cp bwd.rdf.gz  /var/local/BWD/website/bwd.rdf.gz

obs:
	java -cp $(CP) eionet.rdfexport.Execute -f bwd.properties -o bwd.rdf observations

cat:
	java -cp $(CP) eionet.rdfexport.Execute -f bwd.properties -o bwd.rdf watertypes
