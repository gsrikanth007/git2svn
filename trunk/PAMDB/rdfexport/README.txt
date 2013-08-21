The RDF export uses a Java product that was developed for other projects.

There will occasionally be updates to the Java product. When this happens,
then the rdf-exporter-1.0-SNAPSHOT.jar will have to be recompiled.

The RDFExport directory links to an external SVN repository as a symbolic link.
To recompile the rdf-exported do:

    cd RDFExport
    mvn -Dmaven.test.skip=true install
    target/rdf-exporter-1.0-SNAPSHOT.jar ..
    cd ..
    svn ci rdf-exporter-1.0-SNAPSHOT.jar

RDFExport is a Maven project, and the website is here: http://maven.apache.org/

-------------------------------------------------------------------------------

Prerequisites for running RDFExport:
* Install JDK 1.6 or 1.7, make sure %JAVA_HOME% is pointing to it.

To generate RDF files just run make.

The process generates a pam.rdf.gz file, which can then be placed in the website.

Note that the rdfexport.properties file must be configured 
with the correct parameters:    
                
    db.database = jdbc:mysql://localhost:3306/pam_db?characterEncoding=UTF-8
    db.driver=com.mysql.jdbc.Driver
    db.user= <changeme>
    db.password= <changeme>

