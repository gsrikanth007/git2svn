CP="rdf-exporter-1.0-SNAPSHOT.jar:/usr/share/java/mysql-connector-java.jar"

pam.rdf.gz: pam.properties rdf-exporter-1.0-SNAPSHOT.jar
	java -cp $(CP) eionet.rdfexport.Execute -z -f pam.properties -o pam.rdf.gz

