#!/usr/bin/env fish

set distro \
    'alpine' 'amazonlinux' 'busybox' 'centos' 'cirros' 'clearlinux' 'crux' 'debian' 'fedora' \
    'mageia' 'neurodebian' 'opensuse' 'oraclelinux' 'photon' 'ros' 'sourcemage' 'ubuntu' \
    'ubuntu-debootstrp' 'ubuntu-upstart'
set database \
    'aerospike' 'arangodb' 'cassandra' 'couchbase' 'couchdb' 'crate' 'elasticsearch' 'influxdb' \
    'mariadb' 'memcached' 'mongo' 'mongo-express' 'mysql' 'neo4j' 'orientdb' 'percona' 'postgres' \
    'redis' 'rethinkdb'
set language \
    'bash' 'clojure' 'elixir' 'erlang' 'fsharp' 'gcc' 'golang' 'groovy' 'haskell' 'haxe' 'hylang' \
    'ibmjava' 'java' 'jruby' 'julia' 'julialang' 'mono' 'openjdk' 'perl' 'php' 'pypy' 'python' \
    'r-base' 'rakudo-star' 'ruby' 'rust' 'swift' 'thrift'
set web_component \
    'celery' 'django' 'eclipse-mosquitto' 'flink' 'glassfish' 'haproxy' 'hipache' 'httpd' 'iojs' \
    'irssi' 'jetty' 'kapacitor' 'kibana' 'kong' 'lightstreamer' 'nginx' 'node' 'notary' \
    'php-zendserver' 'rails' 'rapidoid' 'redmine' 'storm' 'telegraf' 'tomcat' 'tomee' 'traefik' \
    'websphere-liberty' 'zookeeper'
set application_platform \
    'backdrop' 'convertigo' 'drupal' 'gazebo' 'geonetwork' 'ghost' 'jenkins' 'joomla' 'known' \
    'mediawiki' 'mextcloud' 'nats' 'nats-streaming' 'nuxeo' 'odoo' 'owncloud' 'piwik' 'plone' \
    'rabbitmq' 'rocket.chat' 'solr' 'sonarqube' 'wordpress' 'xwiki'
set other \
    'bonita' 'buildpack-deps' 'chronograf' 'composer' 'docker' 'docker-dev' 'eggdrop' 'gradle' \
    'kaazing-gateway' 'logstash' 'maven' 'registry' 'sentry' 'spiped' 'swarm' 'vault' 'voice-gateway' \
    'znc'

set images $distro $database $language $web_component $application_platform $other

function download_docker_images
    set counter 1
    for image in $images
        set time (date +"%m-%d %H:%M:%S")
        echo "[*] $time Start to download <$counter> image: $image"
        docker pull dockerhub.azk8s.cn/library/$image
        set time (date +"%m-%d %H:%M:%S")
        echo -e "[*] $time Finished download <$counter> image: $image\n"
        set counter (math $counter + 1)
    end
end

# start
download_docker_images
