# -*- mode: ruby; coding: utf-8; -*-
name 'seyren'
maintainer 'Olivier Bazoud'
maintainer_email 'olivier.bazoud@gmail.com'
license 'All rights reserved'
description 'Installs/Configures seyren'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

depends 'java'
depends 'application_java', '~> 3.0.0'
depends 'mongodb'
depends 'tomcat', '~> 0.15.12'
